Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EAAEB2294C
	for <lists+linux-stm32@lfdr.de>; Tue, 12 Aug 2025 15:54:06 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3C146C3F931;
	Tue, 12 Aug 2025 13:54:06 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 01F9CC36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 12 Aug 2025 13:54:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1755006843;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Q//s+/zCNBEzjNslOllCQGV4nFuLBeOueQxvALXBZS0=;
 b=FsOBs53MFI0jFR+2T3HZfYzHe/dHKoSUNhMoSBaobcr77iFZmWKEnd7i6AAHdtzlJkdBEl
 kp7lVaUVT/jutIpiaJi7eRiEJ/BYN98gGLoS98vppqx/GdDiuudGJ/ktsycbezuDgVmln4
 U0xYXm5hHSNNh9lA4cylY+S9O8F7nT4=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-564-er5QOZeMO02FCJ94J5CgbA-1; Tue, 12 Aug 2025 09:54:02 -0400
X-MC-Unique: er5QOZeMO02FCJ94J5CgbA-1
X-Mimecast-MFC-AGG-ID: er5QOZeMO02FCJ94J5CgbA_1755006842
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-4b0a3557d05so117958641cf.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 12 Aug 2025 06:54:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755006842; x=1755611642;
 h=user-agent:in-reply-to:content-disposition:mime-version:references
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Q//s+/zCNBEzjNslOllCQGV4nFuLBeOueQxvALXBZS0=;
 b=eaLLCRBJLrsmybMwyqRu0j+sqo6sW4lrBP7u7MCXpFsTux6JiKMcbmSD2m0yGlpok3
 sZ6DeYU++4sylmAPQzeHGVBEM2VFjKDopt1KNfvoQIS3WeCbuhZS53oxM/o5Ix1MMAtM
 K8ftDGg9KjsTPRQw0mV3Jyd14+v47vm6xe2OP6pFwYbb0QngfwpsT8nqDPWqYNGcj+tQ
 v3MEgiHycUTT8mqwzak1reJHohBnZNfpjXIQMtkuXDyeGYil0I9Ih62rxkxBJtnRsjxr
 5n4sG9apCnP0+6FGMXUMGNyLaYn7yPNksbzF7dxr1Os8fm235+awG18IAUfW1jGdM7Cw
 FoZA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUikT2ehh7Emp+f/siJPKX3JVMF9Yo8aNhlBDLcRDHRR6q+NsPAlMWgDVJbSssD06dAu6KvjW4f+bvQfg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YzsJAil9dB1d4Ydrl7M4jqPcBSEyToC0dn4A/u6ZiI2FwsE7MiR
 mXpoe+d2XB47KSrl0kt8je3cqMACdO7CjjHRzzZzRhSvyvbrqz2CPrHNMp6uOoP76CdvpoB+pZG
 V2muIAhE1HdSyEwayvTEB3AfLmfHJhB3WVmQcwLy2IeakRl5bfcop+HpHAiNxsKzrbbBIbSVp3k
 odrN0RHQ==
X-Gm-Gg: ASbGnctlkvv3ye9fGAat86Z7Ld54hX+Belt4tHVeeeNhgRyxCna1VSBuu1RuceilBWn
 s/dbbuOlELjtG/EpEGFn5ZH0ztfPIQ8pJ/hNqozbDTZICZqteiUC3t8UnfOHp/gCvvJjoC92+ti
 8dqXGoffjDAMb5D0sNx9O5aK+qhUrSHzsvzDnE+EpofMgIm2hv/8qrQFCVSjKv4K1K7DtDXVEZY
 WEtWKSMbDQ3nzp4nnnhF8fCI98bW8Kf2hdG72BAx+ngEGMX5Yhsq94iRXBXUnFIVvMzZUPYB+Xu
 JryGcoztchrRqqXN2n/OYIJO0IkaL5xRD8P7gRuJ4esIdH+p8DQ5YUQnyUmyt6o=
X-Received: by 2002:a05:622a:30c:b0:4a4:2c4c:ccb3 with SMTP id
 d75a77b69052e-4b0aed36723mr265510451cf.38.1755006841706; 
 Tue, 12 Aug 2025 06:54:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHL0wdDdlaxY3Jk0TgFfLYMOMEPwCaVnL7cxWLBN3HaRHoOlakRNGI4PvbhwBJNSUpcz9s5eQ==
X-Received: by 2002:a05:622a:30c:b0:4a4:2c4c:ccb3 with SMTP id
 d75a77b69052e-4b0aed36723mr265508911cf.38.1755006840909; 
 Tue, 12 Aug 2025 06:54:00 -0700 (PDT)
Received: from x1 (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
 by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-4b0aa1efe78sm75493211cf.8.2025.08.12.06.53.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Aug 2025 06:54:00 -0700 (PDT)
Date: Tue, 12 Aug 2025 09:53:54 -0400
From: Brian Masney <bmasney@redhat.com>
To: Icenowy Zheng <uwu@icenowy.me>
Message-ID: <aJtHcs8_671G33Ez@x1>
References: <20250811-clk-for-stephen-round-rate-v1-0-b3bf97b038dc@redhat.com>
 <a151ed7c1caac83e872cf6075c215fa55bd21f82.camel@icenowy.me>
MIME-Version: 1.0
In-Reply-To: <a151ed7c1caac83e872cf6075c215fa55bd21f82.camel@icenowy.me>
User-Agent: Mutt/2.2.14 (2025-02-20)
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: yrUujXZ3HYAJHZZJh_fnjR0w7aCrStfAIKJmOCD3vyw_1755006842
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: Andrew Lunn <andrew@lunn.ch>, Heiko Stuebner <heiko@sntech.de>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Linus Walleij <linus.walleij@linaro.org>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>,
 linux-clk@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 Chanwoo Choi <cw00.choi@samsung.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 Daniel Machon <daniel.machon@microchip.com>,
 Sascha Hauer <s.hauer@pengutronix.de>, sophgo@lists.linux.dev,
 Alex Helms <alexander.helms.jy@renesas.com>, Sven Peter <sven@kernel.org>,
 Qin Jian <qinjian@cqplus1.com>, Scott Branden <sbranden@broadcom.com>,
 linux-kernel@vger.kernel.org, Samuel Holland <samuel.holland@sifive.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Inochi Amaoto <inochiama@gmail.com>,
 Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Alim Akhtar <alim.akhtar@samsung.com>, Max Filippov <jcmvbkbc@gmail.com>,
 Daniel Palmer <daniel@thingy.jp>, soc@lists.linux.dev,
 Viresh Kumar <vireshk@kernel.org>,
 Gregory Clement <gregory.clement@bootlin.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-rockchip@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, linux-actions@lists.infradead.org,
 Maxime Ripard <mripard@kernel.org>, Michal Simek <michal.simek@amd.com>,
 linux-arm-kernel@lists.infradead.org, Neal Gompa <neal@gompa.dev>,
 Stephen Boyd <sboyd@kernel.org>, UNGLinuxDriver@microchip.com,
 linux-renesas-soc@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 imx@lists.linux.dev, Ulf Hansson <ulf.hansson@linaro.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Fabio Estevam <festevam@gmail.com>, Alyssa Rosenzweig <alyssa@rosenzweig.io>,
 Steen Hegelund <Steen.Hegelund@microchip.com>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
 Orson Zhai <orsonzhai@gmail.com>, Keguang Zhang <keguang.zhang@gmail.com>,
 Jacky Huang <ychuang3@nuvoton.com>, Ray Jui <rjui@broadcom.com>,
 Vladimir Zapolskiy <vz@mleia.com>, Baolin Wang <baolin.wang@linux.alibaba.com>,
 spacemit@lists.linux.dev, Cristian Marussi <cristian.marussi@arm.com>,
 Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, asahi@lists.linux.dev,
 Sudeep Holla <sudeep.holla@arm.com>, Romain Perier <romain.perier@gmail.com>,
 Shawn Guo <shawnguo@kernel.org>,
 Andreas =?iso-8859-1?Q?F=E4rber?= <afaerber@suse.de>,
 Liviu Dudau <liviu.dudau@arm.com>, Nicolas Ferre <nicolas.ferre@microchip.com>,
 Paul Cercueil <paul@crapouillou.net>, Shan-Chun Hung <schung@nuvoton.com>,
 linux-riscv@lists.infradead.org, Janne Grunau <j@jannau.net>,
 Chen Wang <unicorn_wang@outlook.com>, arm-scmi@vger.kernel.org,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
 Manivannan Sadhasivam <mani@kernel.org>,
 Takao Orito <orito.takao@socionext.com>, linux-mediatek@lists.infradead.org,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Andrea della Porta <andrea.porta@suse.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Yixun Lan <dlan@gentoo.org>, Taichi Sugaya <sugaya.taichi@socionext.com>,
 patches@opensource.cirrus.com, Bjorn Andersson <andersson@kernel.org>,
 linux-mips@vger.kernel.org, Chunyan Zhang <zhang.lyra@gmail.com>
Subject: Re: [Linux-stm32] [PATCH 000/114] clk: convert drivers from
 deprecated round_rate() to determine_rate()
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

On Tue, Aug 12, 2025 at 09:39:45PM +0800, Icenowy Zheng wrote:
> I was doing a patch to add divider setting support to clk-th1520-ap
> driver and sent patch now, should I remove round_rate from the next
> revision and just keep determine_rate? Is it safe to do this even if
> this patchset is not merged?

Yes, you only need to implement the determine_rate() clk op. Please
remove any references to the round_rate() clk op from your driver. If
you implement both, then only the determine_rate() clk op is actually
used by the clk core.

> In addition, will the clk_round_rate() API exported to other subsystems
> be affected?

No, that will stay as is, and with the same name. The underlying
implementation in the clk core uses the determine_rate() clk op.

Brian

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
