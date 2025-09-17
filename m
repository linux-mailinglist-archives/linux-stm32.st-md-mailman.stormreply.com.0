Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 25E0CB80830
	for <lists+linux-stm32@lfdr.de>; Wed, 17 Sep 2025 17:25:28 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C98F3C3F954;
	Wed, 17 Sep 2025 15:25:27 +0000 (UTC)
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com
 [209.85.167.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6C14EC3F93C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 17 Sep 2025 15:25:27 +0000 (UTC)
Received: by mail-lf1-f46.google.com with SMTP id
 2adb3069b0e04-577232b26a6so1497974e87.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 17 Sep 2025 08:25:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758122724; x=1758727524;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :reply-to:in-reply-to:references:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=q27fzm1U+HTtOJk/CZd2YtayE6m/1WFC4/HuVd7xPus=;
 b=Rn6qqadjkf90qWcjjboX1fG1NOVJlP2ldS+uqjdyvFKwu1XClWF1dLKhUqTLH6MsZ5
 Pgl9Gy6gPZ8nGw6j4MVKidyUp6dJRJ/GD7YEQ974JkGcovrAqYTjQWAYcjil3SDN+qm1
 /45mUiyJNO+HA2CljMB4r2ZQVTmLlRpl+XWBp/frv6TOCbOgmFXA3ELtQkxO+NL7Ajmj
 hCu58BLRpfi8ikbBMpZIxOqHzZdDk0YqhZ4DlQ30Ks7pqAGAl/zT+2u8a7rrnk3BQhbR
 BX520/o7uOjQ9xSSTEc9x861wzYy2bRq+AS3jA+RybNHDxcmHCWN2nMRM2mPdBZijHmf
 e3rg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUDC12gBhMFAv2okqKltw8CmygQxmvYpCEn6/tDkNflFYH2DcOSJIaVZ6fE0w6XrvJFLAb+izh9KqCwAw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yw43/MhEwvkBgaNp8ft2LWyy3mIgvjx/iNADntAceEr5uxbKGNX
 s5+hwsp/Tx3WfccRpkLJuB/3ETVNXz3jNtBg+WiwtOldBsBIbV2euy49NL3aaQPe
X-Gm-Gg: ASbGnctc5TZ9uliiMhoYmqaEUT/FNoHMnfBC/H3mdqHlaE1Ib5ESCHtz0a4onDdKUNk
 lwF7cL5pzokG+YIHzSMEe/pXa/PCFH98GRRu89XF8ebmpr8WvkR+Xa7rL5+Cv2Y2WTJ0i1+/vGV
 mT1gGJBw4yNQmmi1jIAVheOvZYRIEY+QgFCUta88ZrNJjtqTP1pfTjZsV3aJ9sqAMSUKeuC3tZO
 Do3ovCpGy2RxX2/agbls05L1e92iRXeLmt8vtsyuZxqy8N/fumKmAzrXKFtNM31xDhfsmzu/lw7
 tblD1gysUym960N9YsH/xCDG0NhS07hKXEompHktL7rPPwVzmeHq1dmoKJ0UtHvu7fXepGDTlgz
 jTRgQEYsIaY2Iuf5pmTe1mcRsssrvjHQ+iXdA75pVm6Cbui/jYaxUHZGgQyt3Hg==
X-Google-Smtp-Source: AGHT+IFHsLm3MNUminhgoGNVRhSUnG1ucifOPW3JSKEO3CzIQAhPxIaqC0y77KxuvAOOhR6nBuy6hw==
X-Received: by 2002:a05:6512:3c9e:b0:571:1bdc:14bd with SMTP id
 2adb3069b0e04-5779a18c566mr886966e87.56.1758122724178; 
 Wed, 17 Sep 2025 08:25:24 -0700 (PDT)
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com.
 [209.85.167.41]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-56e6460d672sm1938296e87.102.2025.09.17.08.25.22
 for <linux-stm32@st-md-mailman.stormreply.com>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 17 Sep 2025 08:25:22 -0700 (PDT)
Received: by mail-lf1-f41.google.com with SMTP id
 2adb3069b0e04-5720df4acc5so3824848e87.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 17 Sep 2025 08:25:22 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCVIXw7ZQZz2fVGglpUREB1GD4HAwMC0Y1HXdQa1o0VhOl3p0ze7kjBp9ZKtTaYnZVlWagW+uywte37R7A==@st-md-mailman.stormreply.com
X-Received: by 2002:a05:651c:2129:b0:336:ba05:b07f with SMTP id
 38308e7fff4ca-35f63f7b5famr7302181fa.21.1758122722394; Wed, 17 Sep 2025
 08:25:22 -0700 (PDT)
MIME-Version: 1.0
References: <aMrPpc8oRxqGtVPJ@shell.armlinux.org.uk>
 <E1uytpl-00000006H2k-08pH@rmk-PC.armlinux.org.uk>
In-Reply-To: <E1uytpl-00000006H2k-08pH@rmk-PC.armlinux.org.uk>
From: Chen-Yu Tsai <wens@csie.org>
Date: Wed, 17 Sep 2025 23:25:09 +0800
X-Gmail-Original-Message-ID: <CAGb2v64ThmdFN7jHTs6Kf6pG0rhHzQn=X8XXt21qna2HLx3f0g@mail.gmail.com>
X-Gm-Features: AS18NWAKSCnNyj6DLBKT_D2jbUlV9UmfcpG5sUkS8PNH_1L_6YQPZfrfuWMUlOI
Message-ID: <CAGb2v64ThmdFN7jHTs6Kf6pG0rhHzQn=X8XXt21qna2HLx3f0g@mail.gmail.com>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Cc: Drew Fustini <fustini@kernel.org>, Emil Renner Berthing <kernel@esmil.dk>,
 imx@lists.linux.dev, Eric Dumazet <edumazet@google.com>,
 Andrew Lunn <andrew@lunn.ch>, linux-riscv@lists.infradead.org,
 Fabio Estevam <festevam@gmail.com>, linux-stm32@st-md-mailman.stormreply.com,
 Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>,
 Samuel Holland <samuel@sholland.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, linux-sunxi@lists.linux.dev,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Minda Chen <minda.chen@starfivetech.com>, Vladimir Zapolskiy <vz@mleia.com>,
 linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
 Andrew Lunn <andrew+netdev@lunn.ch>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Guo Ren <guoren@kernel.org>,
 Heiner Kallweit <hkallweit1@gmail.com>, Shawn Guo <shawnguo@kernel.org>,
 "David S. Miller" <davem@davemloft.net>, Fu Wei <wefu@redhat.com>
Subject: Re: [Linux-stm32] [PATCH net-next 08/10] net: stmmac: sun8i:
	convert to use phy_interface
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
Reply-To: wens@csie.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

T24gV2VkLCBTZXAgMTcsIDIwMjUgYXQgMTE6MTPigK9QTSBSdXNzZWxsIEtpbmcgKE9yYWNsZSkK
PHJtaytrZXJuZWxAYXJtbGludXgub3JnLnVrPiB3cm90ZToKPgo+IGR3bWFjLXN1bjhpIHN1cHBv
cnRzIE1JSSwgUk1JSSBhbmQgUkdNSUkgaW50ZXJmYWNlIG1vZGVzIG9ubHkuIEl0Cj4gaXMgdW5j
bGVhciB3aGV0aGVyIHRoZSBkd21hYyBjb3JlIGludGVyZmFjZSBpcyBkaWZmZXJlbnQgZnJvbSB0
aGUKPiBvbmUgcHJlc2VudGVkIHRvIHRoZSBvdXRzaWRlIHdvcmxkLgo+Cj4gSG93ZXZlciwgYXMg
bm9uZSBvZiB0aGUgRFRTIGZpbGVzIHNldCAibWFjLW1vZGUiLCBtYWNfaW50ZXJmYWNlIHdpbGwK
PiBiZSBpZGVudGljYWwgdG8gcGh5X2ludGVyZmFjZS4KPgo+IENvbnZlcnQgZHdtYWMtc3VuOGkg
dG8gdXNlIHBoeV9pbnRlcmZhY2Ugd2hlbiBkZXRlcm1pbmluZyB0aGUKPiBpbnRlcmZhY2UgbW9k
ZSByYXRoZXIgdGhhbiBtYWNfaW50ZXJmYWNlLgo+Cj4gU2lnbmVkLW9mZi1ieTogUnVzc2VsbCBL
aW5nIChPcmFjbGUpIDxybWsra2VybmVsQGFybWxpbnV4Lm9yZy51az4KCkFja2VkLWJ5OiBDaGVu
LVl1IFRzYWkgPHdlbnNAY3NpZS5vcmc+Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1t
ZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5
LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
