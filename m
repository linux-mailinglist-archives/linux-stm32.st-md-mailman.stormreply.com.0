Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C5164A4F43
	for <lists+linux-stm32@lfdr.de>; Mon, 31 Jan 2022 20:17:22 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BEFC3C5EC43;
	Mon, 31 Jan 2022 19:17:21 +0000 (UTC)
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com
 [209.85.210.173])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6C20BC5C82A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 31 Jan 2022 19:17:20 +0000 (UTC)
Received: by mail-pf1-f173.google.com with SMTP id i186so11227232pfe.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 31 Jan 2022 11:17:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=7wtjFpATqKxdnDVdQqBB52ek5BkdZ1ljUXCnQMzA+YE=;
 b=X8YBNplQcnUZETMeJkil7YzspkzyBjdzevD8S5EhCJDlexq9s5syiK29gaXExTCG9x
 cBTU4EIAqxFlGcVOy9dLDJTNSr8PAc4KzWn9FXQJCMazJQ14zhMbaFZmdKsT3ySvFcC5
 +r3lQiYQjSJ1Bqpk0g5MKjOK+eUXoYnoOQAyFGhH3u1XL9W7Xvaold+XHeW+20yzb+l/
 HhmEKhdp51lSJjNPWNl/R7wrixvFWjSroT2+z5gRPJ8Qp0ZGv6Dn+lVgXj1OCWm+Sm0V
 TO33xQ1scBCqlq/eQbn3dfG86QcgRdVDfAVm0dM/1ATO/ZU/p9KluVFrM9Y+mm2Oq9/E
 aRow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=7wtjFpATqKxdnDVdQqBB52ek5BkdZ1ljUXCnQMzA+YE=;
 b=WmWvtyp8qzxQuh79SWhiiOctWE8ysditKvTpBLMURtS4KjIntd74tsva2GXYsRZ6tM
 wP/Fg3fm0cm1obJwAagdiMvjr5Dpv54DvudovSJK8sCyPqKwZ4HNMKDoyarBLA3L9gkc
 dVhIh0Q+VZOwLOwArCnCDlpCxKSgtqZ3bjZGNlrnVZ3vDSHUg8AeKzQJJXHjmpMU/BFJ
 AaSxfI3LSWS+YTsj/WBEIfay/CwhAkfUJUE22HiwVwKEsfL9uFnAF7413yHp084C0OoD
 8w/35Jnm+BAUIrlKFhcMRBehQMizAf3Pk7xIH89jNlyIzUwMNmc//XM3Qg1ItQNTNb9S
 lGow==
X-Gm-Message-State: AOAM530/l/xnzzUG1OdJN20NTwKRzlVtWcXg0+ZBRgpeopquJipLVqur
 INUMKnPi2crYyzzjEv78Xg0=
X-Google-Smtp-Source: ABdhPJw11SX7kE9IxFaA0cpVmnKqPcCpGWxwTpOmHd3nspKT1jSnGEI0CQL4NBBvb5g7vvfFUUbwng==
X-Received: by 2002:a63:1d4a:: with SMTP id d10mr18068276pgm.92.1643656638979; 
 Mon, 31 Jan 2022 11:17:18 -0800 (PST)
Received: from hoboy.vegasvil.org ([2601:640:8200:33:e2d5:5eff:fea5:802f])
 by smtp.gmail.com with ESMTPSA id j18sm19961074pfj.13.2022.01.31.11.17.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Jan 2022 11:17:18 -0800 (PST)
Date: Mon, 31 Jan 2022 11:17:06 -0800
From: Richard Cochran <richardcochran@gmail.com>
To: Florian Fainelli <f.fainelli@gmail.com>
Message-ID: <20220131191706.GB24296@hoboy.vegasvil.org>
References: <20220131172450.4905-1-saeed@kernel.org>
 <20220131095905.08722670@hermes.local>
 <CAMuHMdU17cBzivFm9q-VwF9EG5MX75Qct=is=F2h+Kc+VddZ4g@mail.gmail.com>
 <20220131183540.6ekn3z7tudy5ocdl@sx1>
 <30ed8220-e24d-4b40-c7a6-4b09c84f9a1f@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <30ed8220-e24d-4b40-c7a6-4b09c84f9a1f@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
 David Awogbemila <awogbemila@google.com>,
 Linus Walleij <linus.walleij@linaro.org>, rafal@milecki.pl,
 "K . Y . Srinivasan" <kys@microsoft.com>,
 Horatiu Vultur <horatiu.vultur@microchip.com>,
 Andy Gospodarek <andy@greyhouse.net>, Edwin Peer <edwin.peer@broadcom.com>,
 Wei Liu <wei.liu@kernel.org>, Michal Simek <michal.simek@xilinx.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Geert Uytterhoeven <geert@linux-m68k.org>, linux-sunxi@lists.linux.dev,
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
 Hans Ulli Kroll <ulli.kroll@googlemail.com>, Marcin Wojtas <mw@semihalf.com>,
 David Thompson <davthompson@nvidia.com>,
 Lars Povlsen <lars.povlsen@microchip.com>, netdev@vger.kernel.org,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Stephen Hemminger <stephen@networkplumber.org>,
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

On Mon, Jan 31, 2022 at 10:40:38AM -0800, Florian Fainelli wrote:

> Maybe the rule should go like this: any new driver vendor defaults to n, and
> existing ones remain set to y, until we deprecate doing that and switching
> them all off to n by 5.18?

+1

Actually, I wouldn't mind breaking old configs.  Why?  Because never
once have MY configs ever survived a kernel upgrade.  Manual fix ups
are always needed.

Nobody cares about my configs, so why should I care about theirs?

Thanks,
Richard
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
