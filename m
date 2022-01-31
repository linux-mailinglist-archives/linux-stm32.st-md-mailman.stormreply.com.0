Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 515324A57EF
	for <lists+linux-stm32@lfdr.de>; Tue,  1 Feb 2022 08:42:53 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id F0D6FC6046B;
	Tue,  1 Feb 2022 07:42:52 +0000 (UTC)
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com
 [209.85.216.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 821A8C0614D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 31 Jan 2022 17:59:11 +0000 (UTC)
Received: by mail-pj1-f47.google.com with SMTP id
 qe6-20020a17090b4f8600b001b7aaad65b9so8417684pjb.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 31 Jan 2022 09:59:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=networkplumber-org.20210112.gappssmtp.com; s=20210112;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=GTfk5dtnofD+DwQSBTggrf944TpHjURpGaUt6sHxP1Q=;
 b=zo7PV8Zd2Z7HIVMtmOiMcabS1N6sxBbjo3wwW81zQa4IENFd+3e1qlBJHlUZq9ntz+
 XqfG3FiwQvk7BkMKzEkrTK8KhKl8bZCQp61R1xdJf1S9wF/56YoXbTILPq45QQEx1fSh
 qDbMCmpmLx42v5eiBQi+snTnumsDFMmyNi7p2J7qmEpf/Q0W+tWRSYxd7R6rXO23yKNp
 eMGd4RXtD6PUL8AwbxNTR7tmpDMAYcRkYwTmmCgt3rFO3CXoS8g4hf8QkYIQwr1yPT2W
 YKmY+awyasNFLlw+dtDGpSReBp1a0X8b4c5W4Zbb1H5Li7iemUtlEkg083LPRVdpWVvw
 ce3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=GTfk5dtnofD+DwQSBTggrf944TpHjURpGaUt6sHxP1Q=;
 b=tpLE6eaB0zvBTrzcZHwA7adiSOHYdQB8N5l8bMqKv3kTPX2oP8voqz7rRPaT3lHs8e
 EC9wM3Ci+8qk8PtM9yLdr7HqAbOUNbUwrtlFCz5tlJDtUO6SOpxSPVpXsMQ74ZynNM3/
 lIl8AAQhI7oRBWqGk2s9GPEj+CgwUfDn10NMr7NDrN1drsfPb7Jz6D1o13oVRqxSibDc
 IHTjclaQpKEQFhNmAXmi6o8TtxyZc/WbIe6mWVU/EQ60dvwUG6cte9AQzaxCkYympj87
 X9rL8Wj/syxVsfor/SvIU+FsfVMW3hXu1kS/40ffpEbd8JgxFHGj3QJXqyFuSZorjAUd
 Ftqw==
X-Gm-Message-State: AOAM530xJ6rMrOYnOW9zEvnAtq0EBsyBoo0g3DgTKjdKHyZu9onx8zAq
 BR9Q1eeX+5RqdVfPzxgsMwoHRA==
X-Google-Smtp-Source: ABdhPJwUpbKpp1BF/RE/P7pFaFs95WxKDdCWSlLhnXYDb8ikckCTeUYHjKtVxjHYzKFZsy5bOe8h5g==
X-Received: by 2002:a17:90b:1d8d:: with SMTP id
 pf13mr35398210pjb.232.1643651949935; 
 Mon, 31 Jan 2022 09:59:09 -0800 (PST)
Received: from hermes.local (204-195-112-199.wavecable.com. [204.195.112.199])
 by smtp.gmail.com with ESMTPSA id
 o1sm20431282pfu.88.2022.01.31.09.59.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Jan 2022 09:59:09 -0800 (PST)
Date: Mon, 31 Jan 2022 09:59:05 -0800
From: Stephen Hemminger <stephen@networkplumber.org>
To: Saeed Mahameed <saeed@kernel.org>
Message-ID: <20220131095905.08722670@hermes.local>
In-Reply-To: <20220131172450.4905-1-saeed@kernel.org>
References: <20220131172450.4905-1-saeed@kernel.org>
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 01 Feb 2022 07:42:52 +0000
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
 Liming Sun <limings@nvidia.com>, Michael Chan <michael.chan@broadcom.com>,
 Salil Mehta <salil.mehta@huawei.com>, Sergey Shtylyov <s.shtylyov@omp.ru>,
 Oleksij Rempel <linux@rempel-privat.de>, Edward Cree <ecree.xilinx@gmail.com>,
 Saeed Bishara <saeedb@amazon.com>, Mark Einon <mark.einon@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, Vignesh Raghavendra <vigneshr@ti.com>,
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

On Mon, 31 Jan 2022 09:24:50 -0800
Saeed Mahameed <saeed@kernel.org> wrote:

> From: Saeed Mahameed <saeedm@nvidia.com>
> 
> NET_VENDOR_XYZ were defaulted to 'y' for no technical reason.
> 
> Since all drivers belonging to a vendor are supposed to default to 'n',
> defaulting all vendors to 'n' shouldn't be an issue, and aligns well
> with the 'no new drivers' by default mentality.
> 
> Signed-off-by: Saeed Mahameed <saeedm@nvidia.com>

This was done back when vendors were introduced in the network drivers tree.
The default of Y allowed older configurations to just work.

So there was a reason, not sure if it matters anymore.
But it seems like useless repainting to change it now.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
