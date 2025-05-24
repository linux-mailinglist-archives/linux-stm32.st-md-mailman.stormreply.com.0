Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 20057AC2E41
	for <lists+linux-stm32@lfdr.de>; Sat, 24 May 2025 10:21:45 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 93842C78F7B;
	Sat, 24 May 2025 08:21:44 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0CE96C78F62
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 24 May 2025 08:21:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748074902; x=1779610902;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=f9sbU8KiPXi1mKYA5KacKV3bnw+W+YAO+AwFqrTYyvQ=;
 b=jVXu2lCGvA/9ysp4rV6tbJz5NiT2MAIjlw8YXdoVMYdx6b/1OfjsNKsr
 PN/w1lhc5udbhms4/c4mfvPHbnsOatOMFgAqpJWk8nNPJBgbcWiWsP/i9
 ivGoW7Rn059rV9A2QMJvGZuT/ernhRT4jtH3Ie82/8snIVtKrr0jFoVp5
 gVrUgDTFVBQWxF0ZpjaItkHdy8jkiAK0seGvtjxZfkhdLbMLm1N2/QXPB
 +oinjRM3XmKxg7aIuiIqTnG71ihYgVF2KNX22JuPY0PWA9DHwoUWykVxD
 6xnox3fR7wwe/xkoQu4rb7NyJ/2fFMWbU+cxxfnc9N8/3MmvaClae59UO Q==;
X-CSE-ConnectionGUID: Qui1IcE7Qm2Xkb++YYlOTw==
X-CSE-MsgGUID: aeC+oc2GQx68aZIbMpxrVw==
X-IronPort-AV: E=McAfee;i="6700,10204,11441"; a="50005318"
X-IronPort-AV: E=Sophos;i="6.15,311,1739865600"; d="scan'208";a="50005318"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 May 2025 01:21:39 -0700
X-CSE-ConnectionGUID: duR0nArKRb2BC59cL46Qaw==
X-CSE-MsgGUID: BtDtXxCOQTezcn0WOZ8Fzg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,311,1739865600"; d="scan'208";a="146205958"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
 by orviesa003.jf.intel.com with ESMTP; 24 May 2025 01:21:34 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1uIk8K-000R3I-0b;
 Sat, 24 May 2025 08:21:32 +0000
Date: Sat, 24 May 2025 16:21:27 +0800
From: kernel test robot <lkp@intel.com>
To: Sean Anderson <sean.anderson@linux.dev>, netdev@vger.kernel.org,
 Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S . Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Russell King <linux@armlinux.org.uk>
Message-ID: <202505241550.xuPguGhB-lkp@intel.com>
References: <20250523203339.1993685-6-sean.anderson@linux.dev>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250523203339.1993685-6-sean.anderson@linux.dev>
Cc: Kory Maincent <kory.maincent@bootlin.com>,
 Sean Anderson <sean.anderson@linux.dev>,
 linux-stm32@st-md-mailman.stormreply.com,
 Vineeth Karumanchi <vineeth.karumanchi@amd.com>,
 Vladimir Oltean <vladimir.oltean@nxp.com>, llvm@lists.linux.dev,
 Ioana Ciornei <ioana.ciornei@nxp.com>, Daniel Golle <daniel@makrotopia.org>,
 linux-kernel@vger.kernel.org, Simon Horman <horms@kernel.org>,
 oe-kbuild-all@lists.linux.dev, imx@lists.linux.dev,
 Christian Marangi <ansuelsmth@gmail.com>, Lei Wei <quic_leiwei@quicinc.com>,
 Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [Linux-stm32] [net-next PATCH v5 05/10] net: pcs: lynx: Convert
 to an MDIO driver
X-BeenThere: linux-stm32@st-md-mailman.stormreply.com
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: <linux-stm32.st-md-mailman.stormreply.com>
List-Unsubscribe: <https://st-md-mailman.stormreply.com/mailman/options/linux-stm32>, 
 <mailto:linux-stm32-request@st-md-mailman.stormreply.com?subject=unsubscribe>
List-Archive: <http://st-md-mailman.stormreply.com/pipermail/linux-stm32/>
List-Post: <mailto:linux-stm32@st-md-mailman.stormreply.com>
List-Help: <mailto:linux-stm32-request@st-md-mailman.stormreply.com?subject=help>
List-Subscribe: <https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32>, 
 <mailto:linux-stm32-request@st-md-mailman.stormreply.com?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

Hi Sean,

kernel test robot noticed the following build errors:

[auto build test ERROR on net-next/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Sean-Anderson/dt-bindings-net-Add-Xilinx-PCS/20250524-043901
base:   net-next/main
patch link:    https://lore.kernel.org/r/20250523203339.1993685-6-sean.anderson%40linux.dev
patch subject: [net-next PATCH v5 05/10] net: pcs: lynx: Convert to an MDIO driver
config: hexagon-randconfig-001-20250524 (https://download.01.org/0day-ci/archive/20250524/202505241550.xuPguGhB-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project f819f46284f2a79790038e1f6649172789734ae8)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250524/202505241550.xuPguGhB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505241550.xuPguGhB-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/i2c/i2c-core-base.c:24:
   In file included from include/linux/i2c.h:21:
   In file included from include/linux/irqdomain.h:36:
>> include/linux/of.h:1616:34: error: use of undeclared identifier 'OF_RECONFIG_ATTACH_NODE'; did you mean 'OF_RECONFIG_NO_CHANGE'?
    1616 |         return of_changeset_action(ocs, OF_RECONFIG_ATTACH_NODE, np, NULL);
         |                                         ^~~~~~~~~~~~~~~~~~~~~~~
         |                                         OF_RECONFIG_NO_CHANGE
   include/linux/of.h:1591:2: note: 'OF_RECONFIG_NO_CHANGE' declared here
    1591 |         OF_RECONFIG_NO_CHANGE = 0,
         |         ^
>> include/linux/of.h:1622:34: error: use of undeclared identifier 'OF_RECONFIG_DETACH_NODE'; did you mean 'OF_RECONFIG_NO_CHANGE'?
    1622 |         return of_changeset_action(ocs, OF_RECONFIG_DETACH_NODE, np, NULL);
         |                                         ^~~~~~~~~~~~~~~~~~~~~~~
         |                                         OF_RECONFIG_NO_CHANGE
   include/linux/of.h:1591:2: note: 'OF_RECONFIG_NO_CHANGE' declared here
    1591 |         OF_RECONFIG_NO_CHANGE = 0,
         |         ^
>> include/linux/of.h:1628:34: error: use of undeclared identifier 'OF_RECONFIG_ADD_PROPERTY'
    1628 |         return of_changeset_action(ocs, OF_RECONFIG_ADD_PROPERTY, np, prop);
         |                                         ^
>> include/linux/of.h:1634:34: error: use of undeclared identifier 'OF_RECONFIG_REMOVE_PROPERTY'
    1634 |         return of_changeset_action(ocs, OF_RECONFIG_REMOVE_PROPERTY, np, prop);
         |                                         ^
>> include/linux/of.h:1640:34: error: use of undeclared identifier 'OF_RECONFIG_UPDATE_PROPERTY'
    1640 |         return of_changeset_action(ocs, OF_RECONFIG_UPDATE_PROPERTY, np, prop);
         |                                         ^
   5 errors generated.
--
   In file included from drivers/i2c/i2c-core-of-prober.c:14:
   In file included from include/linux/i2c.h:21:
   In file included from include/linux/irqdomain.h:36:
>> include/linux/of.h:1616:34: error: use of undeclared identifier 'OF_RECONFIG_ATTACH_NODE'; did you mean 'OF_RECONFIG_NO_CHANGE'?
    1616 |         return of_changeset_action(ocs, OF_RECONFIG_ATTACH_NODE, np, NULL);
         |                                         ^~~~~~~~~~~~~~~~~~~~~~~
         |                                         OF_RECONFIG_NO_CHANGE
   include/linux/of.h:1591:2: note: 'OF_RECONFIG_NO_CHANGE' declared here
    1591 |         OF_RECONFIG_NO_CHANGE = 0,
         |         ^
>> include/linux/of.h:1622:34: error: use of undeclared identifier 'OF_RECONFIG_DETACH_NODE'; did you mean 'OF_RECONFIG_NO_CHANGE'?
    1622 |         return of_changeset_action(ocs, OF_RECONFIG_DETACH_NODE, np, NULL);
         |                                         ^~~~~~~~~~~~~~~~~~~~~~~
         |                                         OF_RECONFIG_NO_CHANGE
   include/linux/of.h:1591:2: note: 'OF_RECONFIG_NO_CHANGE' declared here
    1591 |         OF_RECONFIG_NO_CHANGE = 0,
         |         ^
>> include/linux/of.h:1628:34: error: use of undeclared identifier 'OF_RECONFIG_ADD_PROPERTY'
    1628 |         return of_changeset_action(ocs, OF_RECONFIG_ADD_PROPERTY, np, prop);
         |                                         ^
>> include/linux/of.h:1634:34: error: use of undeclared identifier 'OF_RECONFIG_REMOVE_PROPERTY'
    1634 |         return of_changeset_action(ocs, OF_RECONFIG_REMOVE_PROPERTY, np, prop);
         |                                         ^
>> include/linux/of.h:1640:34: error: use of undeclared identifier 'OF_RECONFIG_UPDATE_PROPERTY'
    1640 |         return of_changeset_action(ocs, OF_RECONFIG_UPDATE_PROPERTY, np, prop);
         |                                         ^
>> drivers/i2c/i2c-core-of-prober.c:146:2: error: call to undeclared function 'of_get_next_child_with_prefix'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     146 |         for_each_child_of_node_with_prefix(i2c_node, node, type)
         |         ^
   include/linux/of.h:1478:7: note: expanded from macro 'for_each_child_of_node_with_prefix'
    1478 |              of_get_next_child_with_prefix(parent, NULL, prefix);       \
         |              ^
>> drivers/i2c/i2c-core-of-prober.c:146:47: error: incompatible integer to pointer conversion initializing 'struct device_node *' with an expression of type 'int' [-Wint-conversion]
     146 |         for_each_child_of_node_with_prefix(i2c_node, node, type)
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~
   include/linux/of.h:1477:27: note: expanded from macro 'for_each_child_of_node_with_prefix'
    1477 |         for (struct device_node *child __free(device_node) =            \
         |                                  ^
    1478 |              of_get_next_child_with_prefix(parent, NULL, prefix);       \
         |              ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/i2c/i2c-core-of-prober.c:146:2: error: incompatible integer to pointer conversion assigning to 'struct device_node *' from 'int' [-Wint-conversion]
     146 |         for_each_child_of_node_with_prefix(i2c_node, node, type)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/of.h:1480:13: note: expanded from macro 'for_each_child_of_node_with_prefix'
    1480 |              child = of_get_next_child_with_prefix(parent, child, prefix))
         |                    ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/i2c/i2c-core-of-prober.c:161:47: error: incompatible integer to pointer conversion initializing 'struct device_node *' with an expression of type 'int' [-Wint-conversion]
     161 |         for_each_child_of_node_with_prefix(i2c_node, node, type) {
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~
   include/linux/of.h:1477:27: note: expanded from macro 'for_each_child_of_node_with_prefix'
    1477 |         for (struct device_node *child __free(device_node) =            \
         |                                  ^
    1478 |              of_get_next_child_with_prefix(parent, NULL, prefix);       \
         |              ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/i2c/i2c-core-of-prober.c:161:2: error: incompatible integer to pointer conversion assigning to 'struct device_node *' from 'int' [-Wint-conversion]
     161 |         for_each_child_of_node_with_prefix(i2c_node, node, type) {
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/of.h:1480:13: note: expanded from macro 'for_each_child_of_node_with_prefix'
    1480 |              child = of_get_next_child_with_prefix(parent, child, prefix))
         |                    ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   10 errors generated.
--
   In file included from drivers/spi/spi-bcm-qspi.c:17:
>> include/linux/of.h:1616:34: error: use of undeclared identifier 'OF_RECONFIG_ATTACH_NODE'; did you mean 'OF_RECONFIG_NO_CHANGE'?
    1616 |         return of_changeset_action(ocs, OF_RECONFIG_ATTACH_NODE, np, NULL);
         |                                         ^~~~~~~~~~~~~~~~~~~~~~~
         |                                         OF_RECONFIG_NO_CHANGE
   include/linux/of.h:1591:2: note: 'OF_RECONFIG_NO_CHANGE' declared here
    1591 |         OF_RECONFIG_NO_CHANGE = 0,
         |         ^
>> include/linux/of.h:1622:34: error: use of undeclared identifier 'OF_RECONFIG_DETACH_NODE'; did you mean 'OF_RECONFIG_NO_CHANGE'?
    1622 |         return of_changeset_action(ocs, OF_RECONFIG_DETACH_NODE, np, NULL);
         |                                         ^~~~~~~~~~~~~~~~~~~~~~~
         |                                         OF_RECONFIG_NO_CHANGE
   include/linux/of.h:1591:2: note: 'OF_RECONFIG_NO_CHANGE' declared here
    1591 |         OF_RECONFIG_NO_CHANGE = 0,
         |         ^
>> include/linux/of.h:1628:34: error: use of undeclared identifier 'OF_RECONFIG_ADD_PROPERTY'
    1628 |         return of_changeset_action(ocs, OF_RECONFIG_ADD_PROPERTY, np, prop);
         |                                         ^
>> include/linux/of.h:1634:34: error: use of undeclared identifier 'OF_RECONFIG_REMOVE_PROPERTY'
    1634 |         return of_changeset_action(ocs, OF_RECONFIG_REMOVE_PROPERTY, np, prop);
         |                                         ^
>> include/linux/of.h:1640:34: error: use of undeclared identifier 'OF_RECONFIG_UPDATE_PROPERTY'
    1640 |         return of_changeset_action(ocs, OF_RECONFIG_UPDATE_PROPERTY, np, prop);
         |                                         ^
   In file included from drivers/spi/spi-bcm-qspi.c:21:
   In file included from include/linux/spi/spi.h:17:
   In file included from include/linux/scatterlist.h:8:
   In file included from include/linux/mm.h:35:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:98:11: warning: array index 3 is past the end of the array (that has type 'unsigned long[2]') [-Warray-bounds]
      98 |                 return (set->sig[3] | set->sig[2] |
         |                         ^        ~
   include/uapi/asm-generic/signal.h:62:2: note: array 'sig' declared here
      62 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from drivers/spi/spi-bcm-qspi.c:21:
   In file included from include/linux/spi/spi.h:17:
   In file included from include/linux/scatterlist.h:8:
   In file included from include/linux/mm.h:35:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:98:25: warning: array index 2 is past the end of the array (that has type 'unsigned long[2]') [-Warray-bounds]
      98 |                 return (set->sig[3] | set->sig[2] |
         |                                       ^        ~
   include/uapi/asm-generic/signal.h:62:2: note: array 'sig' declared here
      62 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from drivers/spi/spi-bcm-qspi.c:21:
   In file included from include/linux/spi/spi.h:17:
   In file included from include/linux/scatterlist.h:8:
   In file included from include/linux/mm.h:35:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:114:11: warning: array index 3 is past the end of the array (that has type 'const unsigned long[2]') [-Warray-bounds]
     114 |                 return  (set1->sig[3] == set2->sig[3]) &&
         |                          ^         ~
   include/uapi/asm-generic/signal.h:62:2: note: array 'sig' declared here
      62 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from drivers/spi/spi-bcm-qspi.c:21:
   In file included from include/linux/spi/spi.h:17:
   In file included from include/linux/scatterlist.h:8:
   In file included from include/linux/mm.h:35:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:114:27: warning: array index 3 is past the end of the array (that has type 'const unsigned long[2]') [-Warray-bounds]
     114 |                 return  (set1->sig[3] == set2->sig[3]) &&
         |                                          ^         ~
   include/uapi/asm-generic/signal.h:62:2: note: array 'sig' declared here
      62 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from drivers/spi/spi-bcm-qspi.c:21:
   In file included from include/linux/spi/spi.h:17:
   In file included from include/linux/scatterlist.h:8:
   In file included from include/linux/mm.h:35:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:115:5: warning: array index 2 is past the end of the array (that has type 'const unsigned long[2]') [-Warray-bounds]
     115 |                         (set1->sig[2] == set2->sig[2]) &&
         |                          ^         ~
   include/uapi/asm-generic/signal.h:62:2: note: array 'sig' declared here
      62 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from drivers/spi/spi-bcm-qspi.c:21:
   In file included from include/linux/spi/spi.h:17:
   In file included from include/linux/scatterlist.h:8:
   In file included from include/linux/mm.h:35:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:115:21: warning: array index 2 is past the end of the array (that has type 'const unsigned long[2]') [-Warray-bounds]
     115 |                         (set1->sig[2] == set2->sig[2]) &&
         |                                          ^         ~
   include/uapi/asm-generic/signal.h:62:2: note: array 'sig' declared here
      62 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from drivers/spi/spi-bcm-qspi.c:21:
   In file included from include/linux/spi/spi.h:17:
   In file included from include/linux/scatterlist.h:8:
   In file included from include/linux/mm.h:35:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:157:1: warning: array index 3 is past the end of the array (that has type 'const unsigned long[2]') [-Warray-bounds]
     157 | _SIG_SET_BINOP(sigorsets, _sig_or)
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/signal.h:138:8: note: expanded from macro '_SIG_SET_BINOP'
     138 |                 a3 = a->sig[3]; a2 = a->sig[2];                         \
         |                      ^      ~
   include/uapi/asm-generic/signal.h:62:2: note: array 'sig' declared here
      62 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from drivers/spi/spi-bcm-qspi.c:21:
   In file included from include/linux/spi/spi.h:17:
   In file included from include/linux/scatterlist.h:8:
   In file included from include/linux/mm.h:35:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:157:1: warning: array index 2 is past the end of the array (that has type 'const unsigned long[2]') [-Warray-bounds]
     157 | _SIG_SET_BINOP(sigorsets, _sig_or)
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/signal.h:138:24: note: expanded from macro '_SIG_SET_BINOP'
     138 |                 a3 = a->sig[3]; a2 = a->sig[2];                         \
--
   In file included from drivers/spi/spi.c:25:
   In file included from include/linux/of_irq.h:8:
   In file included from include/linux/irqdomain.h:36:
>> include/linux/of.h:1616:34: error: use of undeclared identifier 'OF_RECONFIG_ATTACH_NODE'; did you mean 'OF_RECONFIG_NO_CHANGE'?
    1616 |         return of_changeset_action(ocs, OF_RECONFIG_ATTACH_NODE, np, NULL);
         |                                         ^~~~~~~~~~~~~~~~~~~~~~~
         |                                         OF_RECONFIG_NO_CHANGE
   include/linux/of.h:1591:2: note: 'OF_RECONFIG_NO_CHANGE' declared here
    1591 |         OF_RECONFIG_NO_CHANGE = 0,
         |         ^
>> include/linux/of.h:1622:34: error: use of undeclared identifier 'OF_RECONFIG_DETACH_NODE'; did you mean 'OF_RECONFIG_NO_CHANGE'?
    1622 |         return of_changeset_action(ocs, OF_RECONFIG_DETACH_NODE, np, NULL);
         |                                         ^~~~~~~~~~~~~~~~~~~~~~~
         |                                         OF_RECONFIG_NO_CHANGE
   include/linux/of.h:1591:2: note: 'OF_RECONFIG_NO_CHANGE' declared here
    1591 |         OF_RECONFIG_NO_CHANGE = 0,
         |         ^
>> include/linux/of.h:1628:34: error: use of undeclared identifier 'OF_RECONFIG_ADD_PROPERTY'
    1628 |         return of_changeset_action(ocs, OF_RECONFIG_ADD_PROPERTY, np, prop);
         |                                         ^
>> include/linux/of.h:1634:34: error: use of undeclared identifier 'OF_RECONFIG_REMOVE_PROPERTY'
    1634 |         return of_changeset_action(ocs, OF_RECONFIG_REMOVE_PROPERTY, np, prop);
         |                                         ^
>> include/linux/of.h:1640:34: error: use of undeclared identifier 'OF_RECONFIG_UPDATE_PROPERTY'
    1640 |         return of_changeset_action(ocs, OF_RECONFIG_UPDATE_PROPERTY, np, prop);
         |                                         ^
>> drivers/spi/spi.c:4806:9: error: call to undeclared function 'of_register_spi_device'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    4806 |                 spi = of_register_spi_device(ctlr, rd->dn);
         |                       ^
   drivers/spi/spi.c:4806:9: note: did you mean 'of_register_spi_devices'?
   drivers/spi/spi.c:2554:13: note: 'of_register_spi_devices' declared here
    2554 | static void of_register_spi_devices(struct spi_controller *ctlr) { }
         |             ^
>> drivers/spi/spi.c:4806:7: error: incompatible integer to pointer conversion assigning to 'struct spi_device *' from 'int' [-Wint-conversion]
    4806 |                 spi = of_register_spi_device(ctlr, rd->dn);
         |                     ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   7 errors generated.
--
   In file included from drivers/dma/mmp_pdma.c:18:
   In file included from include/linux/of_dma.h:13:
>> include/linux/of.h:1616:34: error: use of undeclared identifier 'OF_RECONFIG_ATTACH_NODE'; did you mean 'OF_RECONFIG_NO_CHANGE'?
    1616 |         return of_changeset_action(ocs, OF_RECONFIG_ATTACH_NODE, np, NULL);
         |                                         ^~~~~~~~~~~~~~~~~~~~~~~
         |                                         OF_RECONFIG_NO_CHANGE
   include/linux/of.h:1591:2: note: 'OF_RECONFIG_NO_CHANGE' declared here
    1591 |         OF_RECONFIG_NO_CHANGE = 0,
         |         ^
>> include/linux/of.h:1622:34: error: use of undeclared identifier 'OF_RECONFIG_DETACH_NODE'; did you mean 'OF_RECONFIG_NO_CHANGE'?
    1622 |         return of_changeset_action(ocs, OF_RECONFIG_DETACH_NODE, np, NULL);
         |                                         ^~~~~~~~~~~~~~~~~~~~~~~
         |                                         OF_RECONFIG_NO_CHANGE
   include/linux/of.h:1591:2: note: 'OF_RECONFIG_NO_CHANGE' declared here
    1591 |         OF_RECONFIG_NO_CHANGE = 0,
         |         ^
>> include/linux/of.h:1628:34: error: use of undeclared identifier 'OF_RECONFIG_ADD_PROPERTY'
    1628 |         return of_changeset_action(ocs, OF_RECONFIG_ADD_PROPERTY, np, prop);
         |                                         ^
>> include/linux/of.h:1634:34: error: use of undeclared identifier 'OF_RECONFIG_REMOVE_PROPERTY'
    1634 |         return of_changeset_action(ocs, OF_RECONFIG_REMOVE_PROPERTY, np, prop);
         |                                         ^
>> include/linux/of.h:1640:34: error: use of undeclared identifier 'OF_RECONFIG_UPDATE_PROPERTY'
    1640 |         return of_changeset_action(ocs, OF_RECONFIG_UPDATE_PROPERTY, np, prop);
         |                                         ^
   drivers/dma/mmp_pdma.c:1104:27: warning: shift count >= width of type [-Wshift-count-overflow]
    1104 |                 dma_set_mask(pdev->dev, DMA_BIT_MASK(64));
         |                                         ^~~~~~~~~~~~~~~~
   include/linux/dma-mapping.h:73:54: note: expanded from macro 'DMA_BIT_MASK'
      73 | #define DMA_BIT_MASK(n) (((n) == 64) ? ~0ULL : ((1ULL<<(n))-1))
         |                                                      ^ ~~~
   1 warning and 5 errors generated.
--
   In file included from drivers/dma/altera-msgdma.c:22:
   In file included from include/linux/of_dma.h:13:
>> include/linux/of.h:1616:34: error: use of undeclared identifier 'OF_RECONFIG_ATTACH_NODE'; did you mean 'OF_RECONFIG_NO_CHANGE'?
    1616 |         return of_changeset_action(ocs, OF_RECONFIG_ATTACH_NODE, np, NULL);
         |                                         ^~~~~~~~~~~~~~~~~~~~~~~
         |                                         OF_RECONFIG_NO_CHANGE
   include/linux/of.h:1591:2: note: 'OF_RECONFIG_NO_CHANGE' declared here
    1591 |         OF_RECONFIG_NO_CHANGE = 0,
         |         ^
>> include/linux/of.h:1622:34: error: use of undeclared identifier 'OF_RECONFIG_DETACH_NODE'; did you mean 'OF_RECONFIG_NO_CHANGE'?
    1622 |         return of_changeset_action(ocs, OF_RECONFIG_DETACH_NODE, np, NULL);
         |                                         ^~~~~~~~~~~~~~~~~~~~~~~
         |                                         OF_RECONFIG_NO_CHANGE
   include/linux/of.h:1591:2: note: 'OF_RECONFIG_NO_CHANGE' declared here
    1591 |         OF_RECONFIG_NO_CHANGE = 0,
         |         ^
>> include/linux/of.h:1628:34: error: use of undeclared identifier 'OF_RECONFIG_ADD_PROPERTY'
    1628 |         return of_changeset_action(ocs, OF_RECONFIG_ADD_PROPERTY, np, prop);
         |                                         ^
>> include/linux/of.h:1634:34: error: use of undeclared identifier 'OF_RECONFIG_REMOVE_PROPERTY'
    1634 |         return of_changeset_action(ocs, OF_RECONFIG_REMOVE_PROPERTY, np, prop);
         |                                         ^
>> include/linux/of.h:1640:34: error: use of undeclared identifier 'OF_RECONFIG_UPDATE_PROPERTY'
    1640 |         return of_changeset_action(ocs, OF_RECONFIG_UPDATE_PROPERTY, np, prop);
         |                                         ^
   drivers/dma/altera-msgdma.c:895:46: warning: shift count >= width of type [-Wshift-count-overflow]
     895 |         ret = dma_set_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(64));
         |                                                     ^~~~~~~~~~~~~~~~
   include/linux/dma-mapping.h:73:54: note: expanded from macro 'DMA_BIT_MASK'
      73 | #define DMA_BIT_MASK(n) (((n) == 64) ? ~0ULL : ((1ULL<<(n))-1))
         |                                                      ^ ~~~
   1 warning and 5 errors generated.
..

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for OF_DYNAMIC
   Depends on [n]: OF [=n]
   Selected by [y]:
   - FSL_FMAN [=y] && NETDEVICES [=y] && ETHERNET [=y] && NET_VENDOR_FREESCALE [=y] && (FSL_SOC || ARCH_LAYERSCAPE || COMPILE_TEST [=y])


vim +1616 include/linux/of.h

201c910bd6898d Pantelis Antoniou 2014-07-04  1589  
b53a2340d0d304 Pantelis Antoniou 2014-10-28  1590  enum of_reconfig_change {
b53a2340d0d304 Pantelis Antoniou 2014-10-28 @1591  	OF_RECONFIG_NO_CHANGE = 0,
b53a2340d0d304 Pantelis Antoniou 2014-10-28  1592  	OF_RECONFIG_CHANGE_ADD,
b53a2340d0d304 Pantelis Antoniou 2014-10-28  1593  	OF_RECONFIG_CHANGE_REMOVE,
b53a2340d0d304 Pantelis Antoniou 2014-10-28  1594  };
b53a2340d0d304 Pantelis Antoniou 2014-10-28  1595  
2e8fff668dc14e Rob Herring       2023-03-29  1596  struct notifier_block;
2e8fff668dc14e Rob Herring       2023-03-29  1597  
201c910bd6898d Pantelis Antoniou 2014-07-04  1598  #ifdef CONFIG_OF_DYNAMIC
f6892d193fb9d6 Grant Likely      2014-11-21  1599  extern int of_reconfig_notifier_register(struct notifier_block *);
f6892d193fb9d6 Grant Likely      2014-11-21  1600  extern int of_reconfig_notifier_unregister(struct notifier_block *);
f5242e5a883bf1 Grant Likely      2014-11-24  1601  extern int of_reconfig_notify(unsigned long, struct of_reconfig_data *rd);
f5242e5a883bf1 Grant Likely      2014-11-24  1602  extern int of_reconfig_get_state_change(unsigned long action,
f5242e5a883bf1 Grant Likely      2014-11-24  1603  					struct of_reconfig_data *arg);
f6892d193fb9d6 Grant Likely      2014-11-21  1604  
201c910bd6898d Pantelis Antoniou 2014-07-04  1605  extern void of_changeset_init(struct of_changeset *ocs);
201c910bd6898d Pantelis Antoniou 2014-07-04  1606  extern void of_changeset_destroy(struct of_changeset *ocs);
201c910bd6898d Pantelis Antoniou 2014-07-04  1607  extern int of_changeset_apply(struct of_changeset *ocs);
201c910bd6898d Pantelis Antoniou 2014-07-04  1608  extern int of_changeset_revert(struct of_changeset *ocs);
201c910bd6898d Pantelis Antoniou 2014-07-04  1609  extern int of_changeset_action(struct of_changeset *ocs,
201c910bd6898d Pantelis Antoniou 2014-07-04  1610  		unsigned long action, struct device_node *np,
201c910bd6898d Pantelis Antoniou 2014-07-04  1611  		struct property *prop);
201c910bd6898d Pantelis Antoniou 2014-07-04  1612  
201c910bd6898d Pantelis Antoniou 2014-07-04  1613  static inline int of_changeset_attach_node(struct of_changeset *ocs,
201c910bd6898d Pantelis Antoniou 2014-07-04  1614  		struct device_node *np)
201c910bd6898d Pantelis Antoniou 2014-07-04  1615  {
201c910bd6898d Pantelis Antoniou 2014-07-04 @1616  	return of_changeset_action(ocs, OF_RECONFIG_ATTACH_NODE, np, NULL);
201c910bd6898d Pantelis Antoniou 2014-07-04  1617  }
201c910bd6898d Pantelis Antoniou 2014-07-04  1618  
201c910bd6898d Pantelis Antoniou 2014-07-04  1619  static inline int of_changeset_detach_node(struct of_changeset *ocs,
201c910bd6898d Pantelis Antoniou 2014-07-04  1620  		struct device_node *np)
201c910bd6898d Pantelis Antoniou 2014-07-04  1621  {
201c910bd6898d Pantelis Antoniou 2014-07-04 @1622  	return of_changeset_action(ocs, OF_RECONFIG_DETACH_NODE, np, NULL);
201c910bd6898d Pantelis Antoniou 2014-07-04  1623  }
201c910bd6898d Pantelis Antoniou 2014-07-04  1624  
201c910bd6898d Pantelis Antoniou 2014-07-04  1625  static inline int of_changeset_add_property(struct of_changeset *ocs,
201c910bd6898d Pantelis Antoniou 2014-07-04  1626  		struct device_node *np, struct property *prop)
201c910bd6898d Pantelis Antoniou 2014-07-04  1627  {
201c910bd6898d Pantelis Antoniou 2014-07-04 @1628  	return of_changeset_action(ocs, OF_RECONFIG_ADD_PROPERTY, np, prop);
201c910bd6898d Pantelis Antoniou 2014-07-04  1629  }
201c910bd6898d Pantelis Antoniou 2014-07-04  1630  
201c910bd6898d Pantelis Antoniou 2014-07-04  1631  static inline int of_changeset_remove_property(struct of_changeset *ocs,
201c910bd6898d Pantelis Antoniou 2014-07-04  1632  		struct device_node *np, struct property *prop)
201c910bd6898d Pantelis Antoniou 2014-07-04  1633  {
201c910bd6898d Pantelis Antoniou 2014-07-04 @1634  	return of_changeset_action(ocs, OF_RECONFIG_REMOVE_PROPERTY, np, prop);
201c910bd6898d Pantelis Antoniou 2014-07-04  1635  }
201c910bd6898d Pantelis Antoniou 2014-07-04  1636  
201c910bd6898d Pantelis Antoniou 2014-07-04  1637  static inline int of_changeset_update_property(struct of_changeset *ocs,
201c910bd6898d Pantelis Antoniou 2014-07-04  1638  		struct device_node *np, struct property *prop)
201c910bd6898d Pantelis Antoniou 2014-07-04  1639  {
201c910bd6898d Pantelis Antoniou 2014-07-04 @1640  	return of_changeset_action(ocs, OF_RECONFIG_UPDATE_PROPERTY, np, prop);
201c910bd6898d Pantelis Antoniou 2014-07-04  1641  }
b544fc2b8606d7 Lizhi Hou         2023-08-15  1642  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
