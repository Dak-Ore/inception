
<template>
 

<nav class="bg-white border-gray-200">
  <div class="max-w-screen-xl flex flex-wrap items-center justify-between mx-auto p-4">
    <NuxtLink to="/" class="flex items-center space-x-3 rtl:space-x-reverse">
        <span class="self-center text-2xl font-semibold whitespace-nowrap text-blue">Rsebati - Sebastien </span>
    </NuxtLink>
  </div>
</nav>

  <div class="p-10 bg-gray-100">
    <NuxtPage class="max-w-7xl mx-auto p-2" />
  </div>
  <footer class="bg-gray-50">
  <div class="mx-auto max-w-screen-xl px-4 py-8 sm:px-6 lg:px-8">
    <div class="sm:flex sm:items-center sm:justify-between">
      <NuxtLink to="/cv" class="flex justify-center font-bold text-gray-800 sm:justify-start">
        CV
      </NuxtLink>
      <p class="mt-4 text-center text-sm text-gray-500 lg:mt-0 lg:text-right">
        ROGER Sebastien - rsebasti
      </p>
    </div>
  </div>
</footer>


</template>


<style>
.page-enter-active,
  .page-leave-active {
    transition: all 0.2s;
  }
  .page-enter-from,
  .page-leave-to {
    opacity: 0;
    filter: blur(1rem);
}
</style>