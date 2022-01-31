Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C69974A4EA0
	for <lists+linux-stm32@lfdr.de>; Mon, 31 Jan 2022 19:40:50 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7D398C5EC55;
	Mon, 31 Jan 2022 18:40:50 +0000 (UTC)
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com
 [209.85.215.170])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D3BE4C5E2C6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 31 Jan 2022 18:40:48 +0000 (UTC)
Received: by mail-pg1-f170.google.com with SMTP id v3so13066801pgc.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 31 Jan 2022 10:40:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=vUcVq5xhDtsVnawQOYBHe0I2uMjtSwKHFuB7P9A9ZPE=;
 b=Qks15jLuTdFfJB7Yimcf6CFubiKZSrG+lgYbEXhv5CmcREhbsO9I3sHSkFpZJtXCKr
 92ULlrJ1jbtZTyDNycEEatYwo/lYVGPSpPf1Eb96b6UbfuVheN/P13CAiMWNG2SWTU/7
 3kMaW8gywhhLuK1ffBR6cWAnDfHfkbkT4gdENSpeUmj5WtcK+xKXA3d7Ir+6P1b6ySez
 5aKGnhEZanxzbauIs3sIeQq7luxkHgr8QY9yfq7EiP8YuRrN+QQlfEvf8cqeTrWlxUPM
 eHVw4/o/IfeCDvEz6RYo2vuKGwnbY5xuw8UU3STuPVmvw/DN71+Hg6YDgx6nHJknnlYG
 GImA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=vUcVq5xhDtsVnawQOYBHe0I2uMjtSwKHFuB7P9A9ZPE=;
 b=On69HwfcILRdWRlYfIIS4Y9kdmTfJk79IdydzLAaS4xTWYN9mnC4dOn24F0tKf181W
 jFvmfg72fONhTPufdUAhFvqcSXQEmjWktsLzyeC1QLeyV04BFDLEQR4NH7AbEMLO+0fE
 oeQ73ElJ9Q8vqsyxWixZIKWWDZGi0iYj8RgjfZMkbkl5ff/koqZ6IhtiKuPv+Rr8K857
 VpPCNdg5YoECfqO4js2vsLKXiHDqjrTTVtW+C7ONR53sHUfdRJ139pBq9dIiCxE/2KvU
 gky/tgg9jCOChqCtR8jhMdOl5wcS+93FgDuxdEigwRVxniXxVcCUjSwz08HFe7qdlrup
 HSXg==
X-Gm-Message-State: AOAM531Io6yojJv5MiMl5vvc22IBkyp7Ht94igRTNrbeG8udtlzCFrxg
 0Dw6DR1DFRSgAJzGgV2du5I=
X-Google-Smtp-Source: ABdhPJwFcPJi/t2hparKLY2t08LTiTgjCaME1xBLmUfnatI03eGBlVkElbTxSt6cAsqmyFb4Kfa8FA==
X-Received: by 2002:a05:6a00:b51:: with SMTP id
 p17mr12524853pfo.35.1643654447151; 
 Mon, 31 Jan 2022 10:40:47 -0800 (PST)
Received: from [192.168.1.3] (ip72-194-116-95.oc.oc.cox.net. [72.194.116.95])
 by smtp.gmail.com with ESMTPSA id
 s14sm18562705pfk.65.2022.01.31.10.40.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 31 Jan 2022 10:40:45 -0800 (PST)
Message-ID: <30ed8220-e24d-4b40-c7a6-4b09c84f9a1f@gmail.com>
Date: Mon, 31 Jan 2022 10:40:38 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-US
To: Saeed Mahameed <saeedm@nvidia.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>
References: <20220131172450.4905-1-saeed@kernel.org>
 <20220131095905.08722670@hermes.local>
 <CAMuHMdU17cBzivFm9q-VwF9EG5MX75Qct=is=F2h+Kc+VddZ4g@mail.gmail.com>
 <20220131183540.6ekn3z7tudy5ocdl@sx1>
From: Florian Fainelli <f.fainelli@gmail.com>
In-Reply-To: <20220131183540.6ekn3z7tudy5ocdl@sx1>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
 David Awogbemila <awogbemila@google.com>,
 Linus Walleij <linus.walleij@linaro.org>, rafal@milecki.pl,
 "K . Y . Srinivasan" <kys@microsoft.com>,
 Horatiu Vultur <horatiu.vultur@microchip.com>,
 Andy Gospodarek <andy@greyhouse.net>, Edwin Peer <edwin.peer@broadcom.com>,
 Wei Liu <wei.liu@kernel.org>, Michal Simek <michal.simek@xilinx.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>, linux-sunxi@lists.linux.dev,
 Jiri Pirko <jiri@resnulli.us>, l.stelmach@samsung.com,
 Shay Agroskin <shayagr@amazon.com>, Randy Dunlap <rdunlap@infradead.org>,
 linux-kernel@vger.kernel.org, Jon Mason <jdmason@kudzu.us>,
 Shannon Nelson <snelson@pensando.io>,
 Claudiu Beznea <claudiu.beznea@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Chris Snook <chris.snook@gmail.com>, Zhu Yanjun <zyjzyj2000@gmail.com>,
 Tony Nguyen <anthony.l.nguyen@intel.com>,
 Arthur Kiyanovski <akiyano@amazon.com>, Stefan Wahren <stefan.wahren@i2se.com>,
 Stephen Hemminger <sthemmin@microsoft.com>,
 Jesse Brandeburg <jesse.brandeburg@intel.com>,
 linux-stm32@st-md-mailman.stormreply.com, Gabriel Somlo <gsomlo@gmail.com>,
 Rain River <rain.1986.08.12@gmail.com>,
 Martin Habets <habetsm.xilinx@gmail.com>,
 Yisen Zhuang <yisen.zhuang@huawei.com>, Jose Abreu <Jose.Abreu@synopsys.com>,
 Shai Malin <smalin@marvell.com>, Maxime Ripard <mripard@kernel.org>,
 Claudiu Manoil <claudiu.manoil@nxp.com>, drivers@pensando.io,
 Omkar Kulkarni <okulkarni@marvell.com>, linux-arm-kernel@lists.infradead.org,
 Vegard Nossum <vegard.nossum@oracle.com>, David Arinzon <darinzon@amazon.com>,
 Microchip Linux Driver Support <UNGLinuxDriver@microchip.com>,
 linux-renesas-soc@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Catherine Sullivan <csully@google.com>, linux-hyperv@vger.kernel.org,
 oss-drivers@corigine.com, Noam Dagan <ndagan@amazon.com>,
 Rob Herring <robh@kernel.org>, Steen Hegelund <steen.hegelund@microchip.com>,
 Dexuan Cui <decui@microsoft.com>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Chen-Yu Tsai <wens@csie.org>, Joel Stanley <joel@jms.id.au>,
 Simon Horman <simon.horman@corigine.com>,
 Jacob Keller <jacob.e.keller@intel.com>, Asmaa Mnebhi <asmaa@nvidia.com>,
 Arnd Bergmann <arnd@arndb.de>, Haiyang Zhang <haiyangz@microsoft.com>,
 Saeed Mahameed <saeed@kernel.org>, Liming Sun <limings@nvidia.com>,
 Michael Chan <michael.chan@broadcom.com>, Salil Mehta <salil.mehta@huawei.com>,
 Sergey Shtylyov <s.shtylyov@omp.ru>, Oleksij Rempel <linux@rempel-privat.de>,
 Edward Cree <ecree.xilinx@gmail.com>, Saeed Bishara <saeedb@amazon.com>,
 Mark Einon <mark.einon@gmail.com>, "David S. Miller" <davem@davemloft.net>,
 Vignesh Raghavendra <vigneshr@ti.com>,
 Vladimir Oltean <vladimir.oltean@nxp.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Slark Xiao <slark_xiao@163.com>, Gary Guo <gary@garyguo.net>,
 Gerhard Engleder <gerhard@engleder-embedded.com>,
 Jeroen de Borst <jeroendb@google.com>, Lino Sanfilippo <LinoSanfilippo@gmx.de>,
 intel-wired-lan@lists.osuosl.org, Jakub Kicinski <kuba@kernel.org>,
 Prabhakar Kushwaha <pkushwaha@marvell.com>,
 Hans Ulli Kroll <ulli.kroll@googlemail.com>,
 Richard Cochran <richardcochran@gmail.com>, Marcin Wojtas <mw@semihalf.com>,
 David Thompson <davthompson@nvidia.com>,
 Lars Povlsen <lars.povlsen@microchip.com>, netdev@vger.kernel.org,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Stephen Hemminger <stephen@networkplumber.org>
Subject: Re: [Linux-stm32] [PATCH net-next] net: kbuild: Don't default net
 vendor configs to y
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>



On 1/31/2022 10:35 AM, Saeed Mahameed wrote:
> On 31 Jan 19:30, Geert Uytterhoeven wrote:
>> On Mon, Jan 31, 2022 at 6:59 PM Stephen Hemminger
>> <stephen@networkplumber.org> wrote:
>>> On Mon, 31 Jan 2022 09:24:50 -0800
>>> Saeed Mahameed <saeed@kernel.org> wrote:
>>>
>>> > From: Saeed Mahameed <saeedm@nvidia.com>
>>> >
>>> > NET_VENDOR_XYZ were defaulted to 'y' for no technical reason.
>>> >
>>> > Since all drivers belonging to a vendor are supposed to default to 
>>> 'n',
>>> > defaulting all vendors to 'n' shouldn't be an issue, and aligns well
>>> > with the 'no new drivers' by default mentality.
>>> >
>>> > Signed-off-by: Saeed Mahameed <saeedm@nvidia.com>
>>>
>>> This was done back when vendors were introduced in the network 
>>> drivers tree.
>>> The default of Y allowed older configurations to just work.
>>
>> And changing the defaults means all defconfigs must be updated first,
>> else the user's configs will end up without drivers needed.
>>
> 
> As I understand correctly, at least for most common net drivers, having 
> NET_VENDOR_XYZ=y doesn't actually build anything, we have flags per
> module for each vendor and those are defaulted to N.

Right, but once you start hiding NET_VENDOR_DRIVER_XYZ under a 
NET_VENDOR_XYZ Kconfig symbol dependency, if NET_VENDOR_XYZ is not set 
to Y, then you have no way to select NET_VENDOR_DRIVER_XYZ and so your 
old defconfig breaks.

> 
>>> So there was a reason, not sure if it matters anymore.
>>> But it seems like useless repainting to change it now.
>>
>> It might make sense to tune some of the defaults (i.e. change to
>> "default y if ARCH_*") for drivers with clear platform dependencies.
>>
> 
> either set hard default to 'n' or just keep it as is, anything else is just
> more confusion.

Maybe the rule should go like this: any new driver vendor defaults to n, 
and existing ones remain set to y, until we deprecate doing that and 
switching them all off to n by 5.18?
-- 
Florian
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
