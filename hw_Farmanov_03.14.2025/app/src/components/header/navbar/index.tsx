import { Button } from "@/components/ui/button";
import {
  NavigationMenu,
  NavigationMenuItem,
  NavigationMenuList,
} from "@/components/ui/navigation-menu";
import Link from "next/link";

export default function Navbar() {
  return (
    <div className="px-12 flex justify-center shadow">
      <NavigationMenu className="py-4 min-w-full flex justify-between">
        <NavigationMenuList className="gap-4">
          <NavigationMenuItem>
            <Link href="/">Home</Link>
          </NavigationMenuItem>
          <NavigationMenuItem>
            <Link href="/contacts">Contacts</Link>
          </NavigationMenuItem>
          <NavigationMenuItem>
            <Link href="/about">About</Link>
          </NavigationMenuItem>
        </NavigationMenuList>
        <NavigationMenuList>
          <NavigationMenuItem>
            <Button variant="outline">
              <Link href="/auth/sign-in">Sign in</Link>
            </Button>
          </NavigationMenuItem>
        </NavigationMenuList>
      </NavigationMenu>
    </div>
  );
}
