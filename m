Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 574099FDC74
	for <lists+linux-stm32@lfdr.de>; Sat, 28 Dec 2024 23:55:58 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1FC2CC78032;
	Sat, 28 Dec 2024 22:55:58 +0000 (UTC)
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com
 [209.85.167.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 442ACC78030
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 28 Dec 2024 22:55:57 +0000 (UTC)
Received: by mail-lf1-f43.google.com with SMTP id
 2adb3069b0e04-53e399e3310so9972599e87.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 28 Dec 2024 14:55:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1735426556; x=1736031356;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Og/Ya+X+3++Et3/7WcbZEScyD/vU8dvbGouUjKmS+Yg=;
 b=TGiABzvfWVeJMhRlYJNwl5FFyiehVXUFY5UZy+OksRgQxEjTGWQuNH+Q1ROzF9YGAa
 WfEEaSNB2aIPSX+L8YMOqbQQvA9y/gnwaL6wDmPMcsAaBTFJE+lCHOUey46sAnRYCBHH
 7VBArIL0PdABZdI+8fRBHIiLnY+X5jVY1Rx2xvkx5euVSUpE7p0pnprbau9ogWfwZrMa
 LjNaxkcqWK8Q9Htc2HQbrSpm3v7FOoLo4sy0+yT1Jv33m2vlPZ/JBKFkldxEps5/6Tsg
 gLgl+w31cQ+iuV9UHlgdnwWh4IUgdkLyWD62T+EgRHRe5z1K9JcbSE+VpEdETTS5Ttdc
 JtVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1735426556; x=1736031356;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Og/Ya+X+3++Et3/7WcbZEScyD/vU8dvbGouUjKmS+Yg=;
 b=nnbF4vf7xglNV36AlU2Z/d21+eV8lV9YGn4l9Zlp32So/Vrp7KONglhUKUt9RxEnA5
 qnJVWVsePMDs1jGndZ5Mx8LGM1XwPKiOdf/7BfSUUR+hiS1Md4nx2eQLqEMzSXZQUmwR
 pqtQYgbYt8//JRYndEVRaRB8ddhHxatyessK/yrPoj4qbEaYuErsdTUvUMu2oZLlQN89
 JzFhuaCP9h/pXJX1zwJp2F/sBE0HLlpO7vsvNFcAfS0xyPpSK/7HRIAJZvh3+YnqZaAm
 /cgE8tVmsa9r8/C9mL0g/QSOorR19sg56CxsSZhJyMNQucplYVEcad03/X5o4kPBh6r/
 8Hfg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWcQ5v2dZcK7u7lL6xettjNL+h+BFEBCCa+sdRFoWI8wmtVnRbHWSKhdXj5bosdZMGBnKcOHvqQv1i44A==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YwurouHOET9iTETZsx0ByzJFdd2RnQ/7s8ogjg/Z6wPsIWRXp9G
 +Z9sdjzOR5L9RiLWDGG6o3TGuXoFr4khpYc4x/LrC1xsfrVjzrd2cCpVobDdovKiKn2BPKx1Idb
 0J3jrr0ixal6BgNXkxlZMbhSXOUSjA2xKUqUgxQ==
X-Gm-Gg: ASbGncvaFFvoG5XwfqqAzEpWsKCWPrAD3pl+KNQC4d1M7t4jm9tb4TqCcmbBFEZdpRK
 6FNZGmi/0OrZDuCLiipqwG4vDPCbK8QX18F3t
X-Google-Smtp-Source: AGHT+IEOcI/QKkD3AUBydUx80A/BH8Zb+xNHEVzuo3JP6PjvydFsYRRsKbYFCgVkNWvtDpuRPklRSeHgUyviYhKsrpU=
X-Received: by 2002:a05:6512:2246:b0:542:2e04:edd1 with SMTP id
 2adb3069b0e04-5422e04f073mr6848917e87.42.1735426556517; Sat, 28 Dec 2024
 14:55:56 -0800 (PST)
MIME-Version: 1.0
References: <20241228-wake_irq-v1-0-09cfca77cd47@nxp.com>
 <20241228-wake_irq-v1-12-09cfca77cd47@nxp.com>
In-Reply-To: <20241228-wake_irq-v1-12-09cfca77cd47@nxp.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sat, 28 Dec 2024 23:55:45 +0100
Message-ID: <CACRpkdaTBSpk7wToj2TLS1Tgj2cshuSrYgEm4bj-WmFSVohYoQ@mail.gmail.com>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: linux-rtc@vger.kernel.org, Len Brown <len.brown@intel.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>, Peng Fan <peng.fan@nxp.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Daire McNamara <daire.mcnamara@microchip.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-pm@vger.kernel.org,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-kernel@vger.kernel.org,
 Conor Dooley <conor.dooley@microchip.com>, Pavel Machek <pavel@ucw.cz>,
 linux-input@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 12/12] rtc: pl031: Use resource managed
	API to simplify code
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

T24gU2F0LCBEZWMgMjgsIDIwMjQgYXQgMjoxNuKAr0FNIFBlbmcgRmFuIChPU1MpIDxwZW5nLmZh
bkBvc3MubnhwLmNvbT4gd3JvdGU6Cgo+IEZyb206IFBlbmcgRmFuIDxwZW5nLmZhbkBueHAuY29t
Pgo+Cj4gVXNlIGRldm1fcG1fc2V0X3dha2VfaXJxIGFuZCBkZXZtX2RldmljZV9pbml0X3dha2V1
cCB0byBjbGVhbnVwIHRoZQo+IGVycm9yIGhhbmRsaW5nIGNvZGUgYW5kICdkcml2ZXIucmVtb3Zl
KCknIGhvb2suCj4KPiBTaWduZWQtb2ZmLWJ5OiBQZW5nIEZhbiA8cGVuZy5mYW5AbnhwLmNvbT4K
ClJldmlld2VkLWJ5OiBMaW51cyBXYWxsZWlqIDxsaW51cy53YWxsZWlqQGxpbmFyby5vcmc+CgpZ
b3VycywKTGludXMgV2FsbGVpagpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFp
bG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20v
bWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
