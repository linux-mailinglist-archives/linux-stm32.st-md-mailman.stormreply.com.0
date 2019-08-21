Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C1479E36C
	for <lists+linux-stm32@lfdr.de>; Tue, 27 Aug 2019 10:58:32 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1FF04C1E9D9;
	Tue, 27 Aug 2019 08:58:32 +0000 (UTC)
Received: from pb-sasl-trial20.pobox.com (pb-sasl-trial20.pobox.com
 [173.228.157.50])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7672EC36B3E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 21 Aug 2019 20:55:33 +0000 (UTC)
Received: from pb-sasl-trial20.pobox.com (localhost.local [127.0.0.1])
 by pb-sasl-trial20.pobox.com (Postfix) with ESMTP id 894ED35263;
 Wed, 21 Aug 2019 16:55:31 -0400 (EDT)
 (envelope-from nico@fluxnic.net)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=pobox.com; h=date:from:to
 :cc:subject:in-reply-to:message-id:references:mime-version
 :content-type; s=sasl; bh=gHPWV6ywNNDw4FaVfFzykWXQZaE=; b=coNCGr
 qwt7i3R4tUyQi0ZhT3/3VIDhWBBLTzAw70AivukbL9ghU9nPl7F0FIRPBuvKPbKw
 c7CalAaCzCWnkkCCcwbqy1o3zKk9TWKjPdhJsnfKwF9VQuO/B09UmksTxgYUz9wu
 bRu8C5k5LKc4Gf9x7hn/+DaQYD2aeK8p0IeXw=
Received: from pb-smtp20.sea.icgroup.com (pb-smtp20.pobox.com [10.110.30.20])
 by pb-sasl-trial20.pobox.com (Postfix) with ESMTP id 6E5AE35262;
 Wed, 21 Aug 2019 16:55:31 -0400 (EDT)
 (envelope-from nico@fluxnic.net)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed; d=fluxnic.net;
 h=date:from:to:cc:subject:in-reply-to:message-id:references:mime-version:content-type;
 s=2016-12.pbsmtp; bh=tGJUtEAORBsdDqaz81artd/xlpJm4+O0vI06mhjfh+c=;
 b=Bm6jH5TeJ8u7zHDr3U+j7uM4LAxY52cFgZwdS2EFFWXNFK9GQtn5eZUA1GzXW9KWEcBn6hCr6F+jjjS1njBtHu40IijCBy9feUsunydCJOnkBH26hfO8gr4uvy5QgPrfiAWE7p+UCt2+09N9I0cpH0M/jOvLnV1kk5DmQyr29ak=
Received: from yoda.home (unknown [24.203.50.76])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by pb-smtp20.pobox.com (Postfix) with ESMTPSA id 5346231588;
 Wed, 21 Aug 2019 16:55:28 -0400 (EDT)
 (envelope-from nico@fluxnic.net)
Received: from xanadu.home (xanadu.home [192.168.2.2])
 by yoda.home (Postfix) with ESMTPSA id E8EF12DA023B;
 Wed, 21 Aug 2019 16:48:10 -0400 (EDT)
Date: Wed, 21 Aug 2019 16:48:10 -0400 (EDT)
From: Nicolas Pitre <nico@fluxnic.net>
To: Greg KH <gregkh@linuxfoundation.org>
In-Reply-To: <20190821133737.GB4890@kroah.com>
Message-ID: <nycvar.YSQ.7.76.1908211642050.19480@knanqh.ubzr>
References: <20190813121733.52480-1-maennich@google.com>
 <20190821114955.12788-1-maennich@google.com>
 <nycvar.YSQ.7.76.1908210840490.19480@knanqh.ubzr>
 <20190821133737.GB4890@kroah.com>
User-Agent: Alpine 2.21 (LFD 202 2017-01-01)
MIME-Version: 1.0
X-Pobox-Relay-ID: 018ACB2A-C456-11E9-98E8-B0405B776F7B-78420484!pb-smtp20.pobox.com
X-Mailman-Approved-At: Tue, 27 Aug 2019 08:58:26 +0000
Cc: kstewart@linuxfoundation.org, oneukum@suse.com,
 linux-aspeed@lists.ozlabs.org, usb-storage@lists.one-eyed-alien.net,
 Toru Komatsu <k0ma@utam0k.jp>,
 Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 David Howells <dhowells@redhat.com>, yamada.masahiro@socionext.com,
 Will Deacon <will@kernel.org>, patches@opensource.cirrus.com,
 Michael Ellerman <mpe@ellerman.id.au>, hpa@zytor.com, joel@joelfernandes.org,
 bcm-kernel-feedback-list@broadcom.com, sam@ravnborg.org, cocci@systeme.lip6.fr,
 linux-arch@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 Benjamin Fair <benjaminfair@google.com>, linux-scsi@vger.kernel.org,
 Fabio Estevam <festevam@gmail.com>, openbmc@lists.ozlabs.org, x86@kernel.org,
 lucas.de.marchi@gmail.com, Nancy Yuen <yuenn@google.com>, mingo@redhat.com,
 geert@linux-m68k.org, NXP Linux Team <linux-imx@nxp.com>,
 Johannes Weiner <hannes@cmpxchg.org>, Patrick Venture <venture@google.com>,
 stern@rowland.harvard.edu, kernel-team@android.com,
 Dan Williams <dan.j.williams@intel.com>, Ingo Molnar <mingo@kernel.org>,
 linux-rtc@vger.kernel.org, Gleb Fotengauer-Malinovskiy <glebfm@altlinux.org>,
 sspatil@google.com, linux-watchdog@vger.kernel.org,
 Arnd Bergmann <arnd@arndb.de>, linux-kbuild@vger.kernel.org,
 Jani Nikula <jani.nikula@intel.com>, linux-arm-msm@vger.kernel.org,
 jeyu@kernel.org, Matthias Maennich <maennich@google.com>,
 Julia Lawall <julia.lawall@lip6.fr>, linux-m68k@lists.linux-m68k.org,
 linux-mediatek@lists.infradead.org, linux-rpi-kernel@lists.infradead.org,
 linux-tegra@vger.kernel.org, linux-amlogic@lists.infradead.org,
 tglx@linutronix.de, maco@android.com, linux-arm-kernel@lists.infradead.org,
 Adrian Reber <adrian@lisas.de>, linux-hwmon@vger.kernel.org,
 michal.lkml@markovi.net, Ard Biesheuvel <ard.biesheuvel@linaro.org>,
 Andrew Jeffery <andrew@aj.id.au>, Alexey Gladkov <gladkov.alexey@gmail.com>,
 linux-usb@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-kernel@vger.kernel.org, Patrick Bellasi <patrick.bellasi@arm.com>,
 Richard Guy Briggs <rgb@redhat.com>, maco@google.com,
 Pengutronix Kernel Team <kernel@pengutronix.de>, pombredanne@nexb.com,
 Tejun Heo <tj@kernel.org>, Andrew Morton <akpm@linux-foundation.org>,
 "David S. Miller" <davem@davemloft.net>, linux-modules@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH v3 00/11] Symbol Namespaces
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

On Wed, 21 Aug 2019, Greg KH wrote:

> On Wed, Aug 21, 2019 at 08:46:47AM -0400, Nicolas Pitre wrote:
> 
> > One solution for drastically reducing the effective export surface is to 
> > have CONFIG_TRIM_UNUSED_KSYMS=y. This is more extreme than symbol 
> > namespace, but might be worth mentioning nevertheless.
> 
> Oh that's amazing, I never noticed that feature.  That is a nice thing,
> thanks for pointing it out.

For those interested, this feature was demonstrated with numbers here:

https://lwn.net/Articles/746780/


Nicolas
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
