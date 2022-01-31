Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EF3574A4F37
	for <lists+linux-stm32@lfdr.de>; Mon, 31 Jan 2022 20:13:36 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 687E7C5EC43;
	Mon, 31 Jan 2022 19:13:36 +0000 (UTC)
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com
 [209.85.216.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E937BC5C82A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 31 Jan 2022 19:13:34 +0000 (UTC)
Received: by mail-pj1-f43.google.com with SMTP id q63so14901544pja.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 31 Jan 2022 11:13:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent; bh=YZVTL02trY93bXBvFab8GWC4SGTBEHx7xoM5zz31pOg=;
 b=eI59J5vvr0A8RKxUqyE9NUAu6vFBo9JLnOmw0puMQZUEm4dF2MWwJqfR/ZL08CAxWZ
 BnWoSz1sTio7BAV9whmwWT6xUhgWC6Lo5BK4+b2sM6VIImC2/K/OnoTgvKSA94C7mdon
 itSGEALfsQg4ZMdAZ+hZz6HnPPJcZllFKFyICnD2+E8AyYxfPrqC9UOqTS0CeUtdusV1
 D4fD1+rjOl4c4TOP+xFamd2c429GVwsIuvmsUAgjkAklhb5p0GonFbMhGG1gbEVHUG3W
 T9o9E6puaKCHgmEkfQ64cDBJQP0R4HnPSY65B2EhBCUypXC4/lvWzE2EgRcc1SWQbOpz
 19og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=YZVTL02trY93bXBvFab8GWC4SGTBEHx7xoM5zz31pOg=;
 b=H81N08RZ7Sbf+rAUXO/2SuT9Vm7l/0+maLyUOGDkFnRfpNRcJBMGvKmAbg7NBBfI+i
 KddV/iCMMvdH7Gp5bz4mH98jSDjGYCdfM6k36ODOCrAvFfm0O+sHVej71DLMBpYjFfSB
 IdPeQSHwlpTVqCBsKGMncI5KRVJUy3+mRH793vf9UVLtEtv5/oHQ+qKs+ZL3kAQxnVMV
 GuK8UMO3VhcAyIDs/8jOPLE9YHrcdf6VxaBI62JNof+dkNpLAjlBWP7qnesK9It0DCsR
 kk3xckbG0WzFnQlguuXE6RZIYbW22+YBiBYOOG2mSDF0acFBXKs4uU1uHhaAiNXt05SM
 SHiA==
X-Gm-Message-State: AOAM533oj/r9bpniVPlswpHJpMvCuiuwMwNcCKuDveeCA3E/PGh6PzBe
 DgP5H5bUw5ULOrIf7nbZ2ec=
X-Google-Smtp-Source: ABdhPJxZc+Bj3ecmVnKia223vAFW8JsKNa9KxQkDpM9AJ8KxEqdBZ0FJgWcicwws5wLqU29X67c1ZA==
X-Received: by 2002:a17:902:e885:: with SMTP id
 w5mr22303795plg.155.1643656413464; 
 Mon, 31 Jan 2022 11:13:33 -0800 (PST)
Received: from hoboy.vegasvil.org ([2601:640:8200:33:e2d5:5eff:fea5:802f])
 by smtp.gmail.com with ESMTPSA id mj23sm95941pjb.54.2022.01.31.11.13.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Jan 2022 11:13:32 -0800 (PST)
Date: Mon, 31 Jan 2022 11:13:20 -0800
From: Richard Cochran <richardcochran@gmail.com>
To: Shannon Nelson <snelson@pensando.io>
Message-ID: <20220131191320.GA24296@hoboy.vegasvil.org>
References: <20220131172450.4905-1-saeed@kernel.org>
 <e9e124b0-4ea0-e84c-cd8e-1c6ad4df9d74@pensando.io>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <e9e124b0-4ea0-e84c-cd8e-1c6ad4df9d74@pensando.io>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
 UNGLinuxDriver@microchip.com, linux-renesas-soc@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Catherine Sullivan <csully@google.com>, linux-hyperv@vger.kernel.org,
 oss-drivers@corigine.com, Noam Dagan <ndagan@amazon.com>,
 Rob Herring <robh@kernel.org>, Florian Fainelli <f.fainelli@gmail.com>,
 Steen Hegelund <steen.hegelund@microchip.com>,
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
 Hans Ulli Kroll <ulli.kroll@googlemail.com>, Marcin Wojtas <mw@semihalf.com>,
 David Thompson <davthompson@nvidia.com>,
 Lars Povlsen <lars.povlsen@microchip.com>, netdev@vger.kernel.org,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Saeed Mahameed <saeedm@nvidia.com>
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

On Mon, Jan 31, 2022 at 10:04:40AM -0800, Shannon Nelson wrote:
> Is there a particular reason to change this?
> Broken compiles?=A0 Bad drivers?=A0 Over-sized output?

Having default Y is a PITA to people working on an embedded design
that has just one working MAC.  It means having to scroll through tons
of empty stuff when doing `make menuconfig`

Thanks,
Richard
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
