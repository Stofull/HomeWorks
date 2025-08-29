"use client";
import { Button } from "@/components/ui/button";
import {
  Form,
  FormControl,
  FormField,
  FormItem,
  FormLabel,
  FormMessage,
} from "@/components/ui/form";
import { Input } from "@/components/ui/input";
import { zodResolver } from "@hookform/resolvers/zod";
import Image from "next/image";
import Link from "next/link";
import { useForm } from "react-hook-form";
import { z } from "zod";

export default function SignIn() {
  const formSchema = z.object({
    username: z
      .string()
      .min(4, { message: "Username should be at least 4 characters long" })
      .max(16, {
        message: "No more than 16 characters allowed for this field ",
      }),
    password: z
      .string()
      .min(8, { message: "Password should be at least 8 characters long" }),
    email: z.string().email(),
  });

  const form = useForm<z.infer<typeof formSchema>>({
    resolver: zodResolver(formSchema),
    defaultValues: {
      username: "",
      password: "",
    },
  });

  const onSubmit = (data: z.infer<typeof formSchema>) => {
    console.log(data);
  };

  return (
    <div className="flex flex-col gap-4 items-center justify-center min-h-screen bg-gray-100">
      <Button
        variant={"outline"}
        className="absolute left-12 top-4 text-2xl flex items-center justify-center text-center"
      >
        <Link href="/">
          <Image src="/back.svg" alt="arrow-back" width="30" height="30" />
        </Link>
      </Button>
      <h1 className="text-4xl font-extrabold tracking-tight text-gray-900 dark:text-white">
        Welcome back
      </h1>
      <Form {...form}>
        <form
          onSubmit={form.handleSubmit(onSubmit)}
          className="flex flex-col gap-4 p-8 max-w-sm w-full bg-white shadow-lg rounded-lg border border-gray-300"
        >
          <FormField
            name="username"
            render={({ field }) => (
              <FormItem>
                <FormLabel className="text-lg font-semibold text-gray-700">
                  Username
                </FormLabel>
                <FormControl>
                  <Input
                    className="w-full p-3 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-blue-500 transition"
                    placeholder="Enter your username"
                    {...field}
                  />
                </FormControl>
                <FormMessage className="text-red-500 text-sm" />
              </FormItem>
            )}
          />
          <FormField
            name="password"
            control={form.control}
            render={({ field }) => (
              <FormItem>
                <FormLabel className="text-lg font-semibold text-gray-700">
                  Password
                </FormLabel>
                <FormControl>
                  <Input
                    className="w-full p-3 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-blue-500 transition"
                    type="password"
                    placeholder="Enter your password"
                    {...field}
                  />
                </FormControl>
                <FormMessage className="text-red-500 text-sm" />
              </FormItem>
            )}
          />
          <FormField
            name="email"
            control={form.control}
            render={({ field }) => (
              <FormItem>
                <FormLabel className="text-lg font-semibold text-gray-700">
                  Email
                </FormLabel>
                <FormControl>
                  <Input
                    className="w-full p-3 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-blue-500 transition"
                    type="email"
                    placeholder="Enter your email"
                    {...field}
                  />
                </FormControl>
                <FormMessage className="text-red-500 text-sm" />
              </FormItem>
            )}
          />
          <div className="flex flex-col">
            <Button
              variant={"outline"}
              className="mt-4 w-full py-3 bg-stone-900 text-white rounded-md hover:bg-stone-600 transition cursor-pointer"
            >
              Sign up
            </Button>
            <div className="flex gap-1 self-center">
              <p>Already have an account?</p>
              <Link href="/auth/sign-in" className="underline">
                Sign in
              </Link>
            </div>
          </div>
        </form>
      </Form>
    </div>
  );
}
