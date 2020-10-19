Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5058D292B51
	for <lists+linux-stm32@lfdr.de>; Mon, 19 Oct 2020 18:21:00 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B2E08C424B8;
	Mon, 19 Oct 2020 16:20:59 +0000 (UTC)
Received: from smtprelay.hostedemail.com (smtprelay0234.hostedemail.com
 [216.40.44.234])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CAA4FC424B3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 19 Oct 2020 16:20:55 +0000 (UTC)
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net
 [216.40.38.60])
 by smtprelay05.hostedemail.com (Postfix) with ESMTP id 36D2E18029129;
 Mon, 19 Oct 2020 16:20:54 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Spam-Summary: 2, 0, 0, , d41d8cd98f00b204, joe@perches.com, ,
 RULES_HIT:41:355:379:599:800:960:973:988:989:1260:1277:1311:1313:1314:1345:1359:1434:1437:1513:1515:1516:1518:1521:1535:1543:1593:1594:1711:1730:1747:1777:1792:1981:2194:2199:2393:2559:2562:2828:2894:2897:3138:3139:3140:3141:3142:3353:3622:3653:3865:3866:3871:3872:4321:5007:6119:6737:6738:7576:7903:8660:10004:10400:10450:10455:10848:11026:11232:11473:11657:11658:11914:12043:12048:12297:12555:12740:12895:12986:13138:13148:13230:13231:13439:14096:14097:14181:14659:14721:19904:19999:21080:21433:21611:21627:21939:21966:21972:21990:30054:30091,
 0, RBL:none, CacheIP:none, Bayesian:0.5, 0.5, 0.5, Netcheck:none,
 DomainCache:0, MSF:not bulk, SPF:, MSBL:0, DNSBL:none, Custom_rules:0:0:0,
 LFtime:2, LUA_SUMMARY:none
X-HE-Tag: rub62_36025de27238
X-Filterd-Recvd-Size: 5430
Received: from XPS-9350.home (unknown [47.151.133.149])
 (Authenticated sender: joe@perches.com)
 by omf07.hostedemail.com (Postfix) with ESMTPA;
 Mon, 19 Oct 2020 16:20:49 +0000 (UTC)
Message-ID: <5964d734e81c198421bb7f6516dabcad37c1740d.camel@perches.com>
From: Joe Perches <joe@perches.com>
To: "Gustavo A. R. Silva" <gustavo@embeddedor.com>, Christian Lamparter
 <chunkeey@gmail.com>, trix@redhat.com, kvalo@codeaurora.org,
 davem@davemloft.net,  kuba@kernel.org, mcoquelin.stm32@gmail.com,
 alexandre.torgue@st.com,  ath9k-devel@qca.qualcomm.com,
 johannes.berg@intel.com,  emmanuel.grumbach@intel.com,
 luciano.coelho@intel.com, linuxwifi@intel.com,  chunkeey@googlemail.com,
 pkshih@realtek.com, sara.sharon@intel.com,  tova.mussai@intel.com,
 nathan.errera@intel.com, lior2.cohen@intel.com,  john@phrozen.org,
 shaul.triebitz@intel.com, shahar.s.matityahu@intel.com, 
 Larry.Finger@lwfinger.net, zhengbin13@huawei.com,
 christophe.jaillet@wanadoo.fr,  yanaijie@huawei.com,
 saurav.girepunje@gmail.com
Date: Mon, 19 Oct 2020 09:20:48 -0700
In-Reply-To: <fb38b96a-b666-1a6d-211d-b79278a8d878@embeddedor.com>
References: <20201019150507.20574-1-trix@redhat.com>
 <b31478ea-979a-1c9c-65db-32325233a715@gmail.com>
 <859112e91c3d221dc599e381dbaecb90dd6467a1.camel@perches.com>
 <fb38b96a-b666-1a6d-211d-b79278a8d878@embeddedor.com>
User-Agent: Evolution 3.36.4-0ubuntu1 
MIME-Version: 1.0
Cc: netdev@vger.kernel.org, linux-wireless@vger.kernel.org,
 linux-kernel@vger.kernel.org, ath10k@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] wireless: remove unneeded break
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

On Mon, 2020-10-19 at 10:54 -0500, Gustavo A. R. Silva wrote:
> On 10/19/20 10:21, Joe Perches wrote:
> > On Mon, 2020-10-19 at 17:14 +0200, Christian Lamparter wrote:
> > > On 19/10/2020 17:05, trix@redhat.com wrote:
> > > > From: Tom Rix <trix@redhat.com>
> > > > 
> > > > A break is not needed if it is preceded by a return or goto
> > > > 
> > > > Signed-off-by: Tom Rix <trix@redhat.com>
> > > > diff --git a/drivers/net/wireless/intersil/p54/eeprom.c b/drivers/net/wireless/intersil/p54/eeprom.c
[]
> > > > @@ -870,7 +870,6 @@ int p54_parse_eeprom(struct ieee80211_hw *dev, void *eeprom, int len)
> > > >   			} else {
> > > >   				goto good_eeprom;
> > > >   			}
> > > > -			break;
> > > Won't the compiler (gcc) now complain about a missing fallthrough annotation?
> 
> Clang would definitely complain about this.

As far as I can tell, clang 10.0.0 doesn't complain.

This compiles without fallthrough complaint

from make V=1 W=123 CC=clang drivers/net/wireless/intersil/p54/eeprom.o
with -Wimplicit-fallthrough added

$ clang -Wp,-MMD,drivers/net/wireless/intersil/p54/.eeprom.o.d  -nostdinc -isystem /usr/local/lib/clang/10.0.0/include -I./arch/x86/include -I./arch/x86/include/generated  -I./include -I./arch/x86/include/uapi -I./arch/x86/include/generated/uapi -I./include/uapi -I./include/generated/uapi -include ./include/linux/kconfig.h -include ./include/linux/compiler_types.h -D__KERNEL__ -Qunused-arguments -DKBUILD_EXTRA_WARN1 -DKBUILD_EXTRA_WARN2 -DKBUILD_EXTRA_WARN3 -Wall -Wundef -Werror=strict-prototypes -Wno-trigraphs -fno-strict-aliasing -fno-common -fshort-wchar -fno-PIE -Werror=implicit-function-declaration -Werror=implicit-int -Wno-format-security -std=gnu89 -no-integrated-as -Werror=unknown-warning-option -mno-sse -mno-mmx -mno-sse2 -mno-3dnow -mno-avx -m64 -mno-80387 -mstack-alignment=8 -mtune=generic -mno-red-zone -mcmodel=kernel -DCONFIG_X86_X32_ABI -Wno-sign-compare -fno-asynchronous-unwind-tables -mretpoline-external-thunk -fno-delete-null-pointer-checks -Wno-address-of-packed-mem
 ber -O2 -Wframe-larger-than=2048 -fstack-protector-strong -Wno-format-invalid-specifier -Wno-gnu -mno-global-merge -Wno-unused-const-variable -ftrivial-auto-var-init=pattern -pg -mfentry -DCC_USING_FENTRY -falign-functions=32 -Wdeclaration-after-statement -Wvla -Wno-pointer-sign -Wno-array-bounds -fno-strict-overflow -fno-stack-check -Werror=date-time -Werror=incompatible-pointer-types -fcf-protection=none -Wextra -Wunused -Wno-unused-parameter -Wmissing-declarations -Wmissing-format-attribute -Wmissing-prototypes -Wold-style-definition -Wmissing-include-dirs -Wunused-const-variable -Wno-missing-field-initializers -Wno-sign-compare -Wno-type-limits -Wcast-align -Wdisabled-optimization -Wnested-externs -Wshadow -Wmissing-field-initializers -Wtype-limits -Wunused-macros -Wbad-function-cast -Wcast-qual -Wconversion -Wpacked -Wpadded -Wpointer-arith -Wredundant-decls -Wsign-compare -Wswitch-default     -fsanitize=kernel-address -mllvm -asan-mapping-offset=0xdffffc0000000000  -mllvm -asa
 n-globals=1  -mllvm -asan-instrumentation-with-call-threshold=0  -mllvm -asan-stack=0   --param asan-instrument-allocas=1   -fsanitize-coverage=trace-pc -fsanitize-coverage=trace-cmp -Wimplicit-fallthrough    -DKBUILD_MODFILE='"drivers/net/wireless/intersil/p54/p54common"' -DKBUILD_BASENAME='"eeprom"' -DKBUILD_MODNAME='"p54common"' -c -o drivers/net/wireless/intersil/p54/eeprom.o drivers/net/wireless/intersil/p54/eeprom.c


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
