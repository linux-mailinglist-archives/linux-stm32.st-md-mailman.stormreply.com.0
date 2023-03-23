Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 485C86C6210
	for <lists+linux-stm32@lfdr.de>; Thu, 23 Mar 2023 09:40:11 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E165DC6A5F6;
	Thu, 23 Mar 2023 08:40:10 +0000 (UTC)
Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com
 [209.85.219.172])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4B057C69053
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 23 Mar 2023 08:40:09 +0000 (UTC)
Received: by mail-yb1-f172.google.com with SMTP id p203so23846926ybb.13
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 23 Mar 2023 01:40:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679560808;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LVdvufZV56apmT3wmD9ncMcsijkg1/WCzRLjEqhYbYk=;
 b=jt0T1kyTzkSVHHCl6C3RepTUHJHJMJwp3E7PBrhT2/xYa5EtksiTTG/c8wwIzIU4Z/
 SP6qSrUD+NxMXZX1bTG8PCQpgfuHP59u0Np8wiu0KUJPXSqAJzXQDAgAhdBdm4ERqTZu
 W1iU/UXMn4o+x12ZfA1TbzzlGle1mhqc6+pCFoTYeSycXLH0chaeh9w1eBTkD2vOP8sA
 vAdlNnAtJbu1a1BYoccU9GKqHc2Cvh+aARoS6g2QyjguTZ3KI+BylBNheh9Xg9t4NtTd
 2k3OHgvwLC4ljAJqFRZ+gv0eOvpjcGObjDM/uBGal3iyuErBjVTwBqdgO9KbDxL+mVt4
 VMjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679560808;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=LVdvufZV56apmT3wmD9ncMcsijkg1/WCzRLjEqhYbYk=;
 b=EvYsaB61nZF+m6Gob/Rff2KfwvA/PWrRDNqRYSAFtH8TU6An3FsT5R6issAH1M/2ow
 gD1Sdphb4hy+/oUj6SzavHJ61INEeRLHvzXJdLJ1AeYcbVMdCBCabrmCyRD32pBS5FEZ
 5Nyp7fOYa/EdOigzuwEbzVayZBSt/GNxAG8QNQk6zr9cYCJrY5QIOSxFKYc33/naBQXT
 OzZN2USxW03V2llRkOnbLk6lczNTjquoLSq3/Ov/tMEjT+he8IKX8RTAc/gs2OjjVgQO
 S8HJXl8xrV9jMvasWyx+jo6HBUm7hYuJVCNnHEfT5D8TkIIqGTgUwRPpMVy7S3dEosmp
 G+8Q==
X-Gm-Message-State: AAQBX9fiJB/dHsOUI7MFPFW3CFcRDcUpEeK7DxtHqv6OZMwrNGjbhFsg
 bWI94OukYfCmCLAT1QhfbyxmtiLNRqDrafPBHlreyg==
X-Google-Smtp-Source: AKy350aSyoiWihVzfFCCUghPO+0y8OTXazqo59ZooJtguYITdbyYyykALVgXcFtgTaOhhPAE83rDbJuRGMjWP7pJT3I=
X-Received: by 2002:a25:8712:0:b0:b26:47f3:6cb with SMTP id
 a18-20020a258712000000b00b2647f306cbmr1346675ybl.4.1679560808264; Thu, 23 Mar
 2023 01:40:08 -0700 (PDT)
MIME-Version: 1.0
References: <20230317233623.3968172-1-robh@kernel.org>
In-Reply-To: <20230317233623.3968172-1-robh@kernel.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 23 Mar 2023 09:39:57 +0100
Message-ID: <CACRpkdYq4jE7Qn1w8iPeGz7vxj_CeZ+H48B0TVYmeF4Tt=kHgA@mail.gmail.com>
To: Rob Herring <robh@kernel.org>
Cc: alsa-devel@alsa-project.org, Sean Wang <sean.wang@kernel.org>,
 Jacky Bai <ping.bai@nxp.com>, Geert Uytterhoeven <geert+renesas@glider.be>,
 Tomasz Figa <tomasz.figa@gmail.com>, linux-aspeed@lists.ozlabs.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, asahi@lists.linux.dev,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Fabio Estevam <festevam@gmail.com>,
 Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Heiko Stuebner <heiko@sntech.de>,
 linux-renesas-soc@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
 Samuel Holland <samuel@sholland.org>, openbmc@lists.ozlabs.org,
 Manivannan Sadhasivam <mani@kernel.org>,
 Michal Simek <michal.simek@xilinx.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-rockchip@lists.infradead.org,
 Chen-Yu Tsai <wens@csie.org>, Andy Gross <agross@kernel.org>,
 Joel Stanley <joel@jms.id.au>, Alim Akhtar <alim.akhtar@samsung.com>,
 linux-sunxi@lists.linux.dev, NXP Linux Team <linux-imx@nxp.com>,
 devicetree@vger.kernel.org, Charles Keepax <ckeepax@opensource.cirrus.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Sven Peter <sven@svenpeter.dev>,
 linux-arm-msm@vger.kernel.org, Sascha Hauer <s.hauer@pengutronix.de>,
 linux-actions@lists.infradead.org, linux-gpio@vger.kernel.org,
 Richard Fitzgerald <rf@opensource.cirrus.com>,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Dong Aisheng <aisheng.dong@nxp.com>, Damien Le Moal <damien.lemoal@wdc.com>,
 Andrew Jeffery <andrew@aj.id.au>, Dvorkin Dmitry <dvorkin@tibbo.com>,
 Bjorn Andersson <andersson@kernel.org>, Hector Martin <marcan@marcan.st>,
 linux-kernel@vger.kernel.org, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Jianlong Huang <jianlong.huang@starfivetech.com>,
 linux-riscv@lists.infradead.org, Masami Hiramatsu <mhiramat@kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>, patches@opensource.cirrus.com,
 Wells Lu <wellslutw@gmail.com>, Emil Renner Berthing <kernel@esmil.dk>,
 Shawn Guo <shawnguo@kernel.org>,
 =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>
Subject: Re: [Linux-stm32] [PATCH] dt-bindings: pinctrl: Drop unneeded quotes
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

T24gU2F0LCBNYXIgMTgsIDIwMjMgYXQgMTI6MzbigK9BTSBSb2IgSGVycmluZyA8cm9iaEBrZXJu
ZWwub3JnPiB3cm90ZToKCj4gQ2xlYW51cCBiaW5kaW5ncyBkcm9wcGluZyB1bm5lZWRlZCBxdW90
ZXMuIE9uY2UgYWxsIHRoZXNlIGFyZSBmaXhlZCwKPiBjaGVja2luZyBmb3IgdGhpcyBjYW4gYmUg
ZW5hYmxlZCBpbiB5YW1sbGludC4KPgo+IFNpZ25lZC1vZmYtYnk6IFJvYiBIZXJyaW5nIDxyb2Jo
QGtlcm5lbC5vcmc+CgpTaG91bGQgSSBxdWV1ZSB0aGlzIHBhdGNoIGJ5IHRoZSB3YXksIG9yIGRv
IHlvdSBuZWVkIGl0IHRvIGdvIGludG8gc29tZQpEVC1yZWxhdGVkIHRyZWU/CgpZb3VycywKTGlu
dXMgV2FsbGVpagpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9y
bXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9s
aXN0aW5mby9saW51eC1zdG0zMgo=
