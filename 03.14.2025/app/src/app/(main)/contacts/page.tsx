import { Accordion, AccordionItem } from "@/components/ui/accordion";
import { AccordionContent, AccordionTrigger } from "@radix-ui/react-accordion";
import React from "react";

export default function Contacts() {
  const data = [
    { id: 1, title: "New York", desc: "123 Main St, New York, NY 10001" },
    {
      id: 2,
      title: "Los Angeles",
      desc: "456 Sunset Blvd, Los Angeles, CA 90028",
    },
    { id: 3, title: "Chicago", desc: "789 Michigan Ave, Chicago, IL 60611" },
  ];

  return (
    <div className="mx-auto mt-8 max-w-2xl p-6 text-center">
      <h1 className="text-4xl font-extrabold tracking-tight text-gray-900 dark:text-white">
        Contact Us
      </h1>
      <p className="mt-2 text-lg text-gray-600 dark:text-gray-300">
        Find our offices in different cities
      </p>
      <Accordion type="single" collapsible className="mt-6 w-full space-y-4">
        {data.map((item) => (
          <AccordionItem
            key={item.id}
            value={`item-${item.id}`}
            className="border rounded-lg shadow-sm"
          >
            <AccordionTrigger className="px-4 py-3 text-lg font-medium text-gray-900 dark:text-white cursor-pointer hover:bg-gray-100 dark:hover:bg-gray-800 rounded-lg transition-all">
              {item.title}
            </AccordionTrigger>
            <AccordionContent className="px-4 py-3 text-gray-700 dark:text-gray-300">
              {item.desc}
            </AccordionContent>
          </AccordionItem>
        ))}
      </Accordion>
    </div>
  );
}
