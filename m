Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 32C376C055B
	for <lists+linux-stm32@lfdr.de>; Sun, 19 Mar 2023 22:17:09 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id ED0BEC6A5E7;
	Sun, 19 Mar 2023 21:17:08 +0000 (UTC)
Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com
 [209.85.219.170])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4A288C57B6A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 19 Mar 2023 21:17:07 +0000 (UTC)
Received: by mail-yb1-f170.google.com with SMTP id k17so111109ybm.11
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 19 Mar 2023 14:17:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679260626;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=umIKUZ29cWxRGLpplScGRMR85hsAlE3Adfx/LlasVhM=;
 b=odOHan5KodgnZmQYP5bE+Zx5oWuObSka+JlAj9+I+PEuls9mRUte5Fd1E9WehPEH0v
 ZEUouTX/UvXXQBiT/SNrO1n/f3o+kSQlfaYmdNK4DAR8Ejqf2fhzotkFgCdRQtcs1CVC
 t5VLMfDqC+6dzZCRc67iIWhzpcy/Pk8gir+iKkECVK6wCNHZH2ZDuC5lvdh7tZq5DQuj
 ObQBbb4TSLQVxE7XBRQy+d8Lbb9XjTL/2eJtfomhereizk9tghsCcrHhrXpWlcA+TL2p
 v61FtSAq1/yzKQz5Qm+nbB//3YVMqfY7U/pGKdm4qJTu9FwuezpIoi2MADQXjrLIWQlB
 6CZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679260626;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=umIKUZ29cWxRGLpplScGRMR85hsAlE3Adfx/LlasVhM=;
 b=U7Lox8xie+F+kUx04ib8YyJo+16Zwmf2OaluuOuzA8baKPirzgqjVYkM5AF7VHroU3
 qJMYMdWl8909UipU+KKo6cvT8TQr5/WkPlPuDwNzof09hknfK1Kmn3CCoo2ypUH6jeHg
 SNNGUjj4CI37uNit0QQ/e5/FhEMcLXtnMoT7rmypo5zyuYbpry9F+HmNTzLXBS7VFrz2
 BVLxwCRc4qzD2V6+in0w3JbfGKK51U88OyyH+UWSIECOAgX16lf42LbQzLbCF9jP93TN
 ugV7xTf6ZU1AMc4enlvNoEc8TIBoIuLkORTcUPRhmZRR9RIa00Z2MgivNRHNvi/aBhkL
 bkCQ==
X-Gm-Message-State: AO0yUKXV1zSd7nJLAt7vJA7TLeVsm3lml5Z+oG9mskJsQvto+sznU3qZ
 map58UJ5SL210PudIZBFRTtuwQuT+N/FG+pioQ6o3g==
X-Google-Smtp-Source: AK7set9Y0TmDGARQ0tonQqRCQHdH+03X2NR6qq22FebqKohfKPMVp4wrMtKTGiLfsl0XoE3P/cG/TeF1FO39PIanZTY=
X-Received: by 2002:a05:6902:1143:b0:aa9:bd2e:3746 with SMTP id
 p3-20020a056902114300b00aa9bd2e3746mr2999493ybu.4.1679260626301; Sun, 19 Mar
 2023 14:17:06 -0700 (PDT)
MIME-Version: 1.0
References: <20230317233631.3968509-1-robh@kernel.org>
In-Reply-To: <20230317233631.3968509-1-robh@kernel.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sun, 19 Mar 2023 22:16:55 +0100
Message-ID: <CACRpkdY0twhF1+ipbV0DuWUdeCyq09uZidyVSNr7eW=K6ecnkw@mail.gmail.com>
To: Rob Herring <robh@kernel.org>
X-Topics: 
Cc: Vignesh Raghavendra <vigneshr@ti.com>,
 Naga Sureshkumar Relli <nagasure@xilinx.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 linux-stm32@st-md-mailman.stormreply.com, Heiko Stuebner <heiko@sntech.de>,
 linux-renesas-soc@vger.kernel.org, Samuel Holland <samuel@sholland.org>,
 Richard Weinberger <richard@nod.at>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, linux-rockchip@lists.infradead.org,
 Tudor Ambarus <tudor.ambarus@linaro.org>, Andy Gross <agross@kernel.org>,
 linux-sunxi@lists.linux.dev, devicetree@vger.kernel.org,
 Manivannan Sadhasivam <mani@kernel.org>, linux-arm-msm@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Bjorn Andersson <andersson@kernel.org>,
 linux-kernel@vger.kernel.org, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Michael Walle <michael@walle.cc>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-mtd@lists.infradead.org, Pratyush Yadav <pratyush@kernel.org>
Subject: Re: [Linux-stm32] [PATCH] dt-bindings: mtd: Drop unneeded quotes
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
QGtlcm5lbC5vcmc+CgpSZXZpZXdlZC1ieTogTGludXMgV2FsbGVpaiA8bGludXMud2FsbGVpakBs
aW5hcm8ub3JnPgoKWW91cnMsCkxpbnVzIFdhbGxlaWoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0
bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0
b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
