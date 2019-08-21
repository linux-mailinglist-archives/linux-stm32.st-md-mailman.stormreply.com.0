Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 536F69E368
	for <lists+linux-stm32@lfdr.de>; Tue, 27 Aug 2019 10:58:31 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 822B8C24023;
	Tue, 27 Aug 2019 08:58:30 +0000 (UTC)
Received: from pb-sasl-trial21.pobox.com (pb-sasl-trial21.pobox.com
 [173.228.157.51])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9947FC36B3E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 21 Aug 2019 12:55:31 +0000 (UTC)
Received: from pb-sasl-trial21.pobox.com (localhost.local [127.0.0.1])
 by pb-sasl-trial21.pobox.com (Postfix) with ESMTP id 436CE19497;
 Wed, 21 Aug 2019 08:55:29 -0400 (EDT)
 (envelope-from nico@fluxnic.net)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=pobox.com; h=date:from:to
 :cc:subject:in-reply-to:message-id:references:mime-version
 :content-type; s=sasl; bh=8OJtyeNZ9sCoH4BVmhH8yW8Bvtc=; b=c1PME/
 SJzr4aFk09ikfKp1bezTdBSw1zwNS3hrdNtoOqlYZR7yA8XltYBalyFTKDMKbjP0
 N65/OlgmcPY1jK1+z15I44JCS9KM0+7x8/h7bHxlIX4/NT+azCbj5YqM8+gMtbTp
 uXIkLMunbK+ZmjnijFcehZ1TUdsCiepGgzujk=
Received: from pb-smtp21.sea.icgroup.com (pb-smtp21.pobox.com [10.110.30.21])
 by pb-sasl-trial21.pobox.com (Postfix) with ESMTP id 2440419496;
 Wed, 21 Aug 2019 08:55:29 -0400 (EDT)
 (envelope-from nico@fluxnic.net)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed; d=fluxnic.net;
 h=date:from:to:cc:subject:in-reply-to:message-id:references:mime-version:content-type;
 s=2016-12.pbsmtp; bh=V25/yKN9jlMjRVCEXCSuKB+Re2Fd96dfPM01Z+/Jqwg=;
 b=u8QzXJ4jPt13KgiTpgzojpKoWuF5UnQufQIrmIF1V1GDjy6AYPilfpABHbSnzJ1cD46DKsQ+JPEMRPYBtPL2vVu09z8iN4C6o7z6Kg63KVX0atNi1l+zBI4OCk5fsPv9COf6vzghotcslIvOnBR1dt1b3O/PjBpbMEOUK+25Eh8=
Received: from yoda.home (unknown [24.203.50.76])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by pb-smtp21.pobox.com (Postfix) with ESMTPSA id 8A9D482416;
 Wed, 21 Aug 2019 08:55:24 -0400 (EDT)
 (envelope-from nico@fluxnic.net)
Received: from xanadu.home (xanadu.home [192.168.2.2])
 by yoda.home (Postfix) with ESMTPSA id 0CE5A2DA023B;
 Wed, 21 Aug 2019 08:46:48 -0400 (EDT)
Date: Wed, 21 Aug 2019 08:46:47 -0400 (EDT)
From: Nicolas Pitre <nico@fluxnic.net>
To: Matthias Maennich <maennich@google.com>
In-Reply-To: <20190821114955.12788-1-maennich@google.com>
Message-ID: <nycvar.YSQ.7.76.1908210840490.19480@knanqh.ubzr>
References: <20190813121733.52480-1-maennich@google.com>
 <20190821114955.12788-1-maennich@google.com>
User-Agent: Alpine 2.21 (LFD 202 2017-01-01)
MIME-Version: 1.0
X-Pobox-Relay-ID: F127EA26-C412-11E9-8458-8D86F504CC47-78420484!pb-smtp21.pobox.com
X-Mailman-Approved-At: Tue, 27 Aug 2019 08:58:26 +0000
Cc: kstewart@linuxfoundation.org, oneukum@suse.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-aspeed@lists.ozlabs.org,
 usb-storage@lists.one-eyed-alien.net, Toru Komatsu <k0ma@utam0k.jp>,
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
 Ingo Molnar <mingo@kernel.org>, linux-rtc@vger.kernel.org,
 Gleb Fotengauer-Malinovskiy <glebfm@altlinux.org>, sspatil@google.com,
 linux-watchdog@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
 linux-kbuild@vger.kernel.org, Jani Nikula <jani.nikula@intel.com>,
 linux-arm-msm@vger.kernel.org, jeyu@kernel.org,
 Dan Williams <dan.j.williams@intel.com>, Julia Lawall <julia.lawall@lip6.fr>,
 linux-m68k@lists.linux-m68k.org, linux-mediatek@lists.infradead.org,
 linux-rpi-kernel@lists.infradead.org, linux-tegra@vger.kernel.org,
 linux-amlogic@lists.infradead.org, tglx@linutronix.de, maco@android.com,
 linux-arm-kernel@lists.infradead.org, Adrian Reber <adrian@lisas.de>,
 linux-hwmon@vger.kernel.org, michal.lkml@markovi.net,
 Ard Biesheuvel <ard.biesheuvel@linaro.org>, Andrew Jeffery <andrew@aj.id.au>,
 gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
 Alexey Gladkov <gladkov.alexey@gmail.com>, linux-kernel@vger.kernel.org,
 Patrick Bellasi <patrick.bellasi@arm.com>, Richard Guy Briggs <rgb@redhat.com>,
 maco@google.com, Pengutronix Kernel Team <kernel@pengutronix.de>,
 pombredanne@nexb.com, Tejun Heo <tj@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
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

On Wed, 21 Aug 2019, Matthias Maennich wrote:

> As of Linux 5.3-rc5, there are 31205 [1] exported symbols in the kernel.
> That is a growth of roughly 1000 symbols since 4.17 (30206 [2]).  There
> seems to be some consensus amongst kernel devs that the export surface
> is too large, and hard to reason about.

This is good work.

One solution for drastically reducing the effective export surface is to 
have CONFIG_TRIM_UNUSED_KSYMS=y. This is more extreme than symbol 
namespace, but might be worth mentioning nevertheless.


Nicolas
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
