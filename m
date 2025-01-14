Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 164DEA106CE
	for <lists+linux-stm32@lfdr.de>; Tue, 14 Jan 2025 13:38:33 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B2776C7802D;
	Tue, 14 Jan 2025 12:38:32 +0000 (UTC)
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com
 [209.85.167.51])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7E83AC7801E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 14 Jan 2025 12:38:24 +0000 (UTC)
Received: by mail-lf1-f51.google.com with SMTP id
 2adb3069b0e04-53e384e3481so4945356e87.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 14 Jan 2025 04:38:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1736858304; x=1737463104;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FOy+fpUcZjo3NQOA4lzsuRXkHenykO5B1X4kehGjluI=;
 b=B8aJLStQ3yeO0r7B6Y/cB8+dJZik+eaGI8qBEdGBdNAQZol7bI9ie9bHWVmrt0bSyf
 WiBX8YvuBiYclVrVljU6UGeMEkGcxfzxpsIlC3GQUoQfXTznJNcjoJOrBL6HPbVgJcIh
 jy7SIz+WBN4FWkEEa7fB02bN4YUHSb6T9Tzccwxzz2h0wrcEACKN113iO3AlXnhoLXEK
 U1eDSXV6pih6biPrCOrygCOBrRilcXLVPITnnO7QvYRF7XAo5Z+U6Uc6+nCZ9sO8a7k/
 Jzf4CSciaqYJHSioYWOnY0dGmZkLiCv9CwdF9z5jr8kIHe3taXV1XMr1v2A6RHsdmlHi
 aV7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736858304; x=1737463104;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=FOy+fpUcZjo3NQOA4lzsuRXkHenykO5B1X4kehGjluI=;
 b=TiEn9ARW1e/bUWPi0nVy6OJqq8xblMmnQk1jneNYGFrBNin0HskJCrVpgDmo0mxyQR
 wlRnSmqWrnu32UOtjo27dgb3xIhPDfH7IMgcZV2faO34QmCGYCJm7INqMdqegW0JLWZg
 kDc6OPySHZLtd/mYS1RrxyOWCYDokYP35Udq/BjobLshF/2bFN9ZC5wMrU+afRXNFy2W
 UUA24vKz4RUKWkozFCU+z2psAedRdigrFqIW4Rd/o0yDX8FrcRxLih/Sb5aq1v9OCYbh
 vA5mazx8m1In5I/UT+WwDLwCKuJ/JgUuu65NW/rWDRZcIQ6LIx40kNPYsdKPrLrO+Rtq
 KS5Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCXjPQCvWpSUnz8awP9RObp32nqpOx9laVZFRr821BaPpwi79dTqdMvNbh/j22aHmLg+V9U/tteHBVgKRQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yy35zv5GVm4Yqsx4SuHjS9Xm2VhDy+U6WqhRt9+prssKRw6cg0+
 ID8hpc1mgGivzZqyNjlmpLlC89XPJv0XazrvXXUMZFw+HDJ5423MYnbUEFBEf8W+5D8ESb4MmaT
 2l9g2F2vMcvBXk6sjvPCW01YAuWtJ3VWtEs6niQ==
X-Gm-Gg: ASbGnctpmHh02fF2rq5Al8jAbVfEHkcXCEn7UNnyGaJ5ML6y/tBHw2mz+eDNeSe3lul
 ktHsg8vfUBTsK1IxULhgxUBOyH+6UiCNEAD+4
X-Google-Smtp-Source: AGHT+IGcvU/U3n3KiVK8Pas9Rl6/CCuxSKRYPHEejh00b9yg8f2JKHdOjjfDGEy+haFbClEH/nX0/RcLgiFJCruBWNo=
X-Received: by 2002:a05:6512:b03:b0:540:2fd2:6c87 with SMTP id
 2adb3069b0e04-542845ba92amr8849466e87.16.1736858303656; Tue, 14 Jan 2025
 04:38:23 -0800 (PST)
MIME-Version: 1.0
References: <20250106220659.2640365-1-zmw12306@gmail.com>
In-Reply-To: <20250106220659.2640365-1-zmw12306@gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 14 Jan 2025 13:38:12 +0100
X-Gm-Features: AbW1kvbmhkHMhFNltkPbxNdF01Aj3zGBI5__ealYxb0W8ke6YgJlZ3LsL-hjuu4
Message-ID: <CACRpkdYG6EO2x60Hj2tN3ucOQsA1c_x2hh5gd4frr=D5V=Lbgg@mail.gmail.com>
To: Mingwei Zheng <zmw12306@gmail.com>
Cc: marex@denx.de, make24@iscas.ac.cn, linux-kernel@vger.kernel.org,
 peng.fan@nxp.com, linux-gpio@vger.kernel.org,
 Jiasheng Jiang <jiashengjiangcool@gmail.com>, fabien.dessenne@foss.st.com,
 mcoquelin.stm32@gmail.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v10] pinctrl: stm32: Add check for
	clk_enable()
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

T24gTW9uLCBKYW4gNiwgMjAyNSBhdCAxMTowNOKAr1BNIE1pbmd3ZWkgWmhlbmcgPHptdzEyMzA2
QGdtYWlsLmNvbT4gd3JvdGU6Cgo+IENvbnZlcnQgdGhlIGRyaXZlciB0byBjbGtfYnVsayooKSBB
UEkuCj4gQWRkIGNoZWNrIGZvciB0aGUgcmV0dXJuIHZhbHVlIG9mIGNsa19idWxrX2VuYWJsZSgp
IHRvIGNhdGNoCj4gdGhlIHBvdGVudGlhbCBlcnJvci4KPgo+IEZpeGVzOiAwNWQ4YWY0NDlkOTMg
KCJwaW5jdHJsOiBzdG0zMjogS2VlcCBwaW5jdHJsIGJsb2NrIGNsb2NrIGVuYWJsZWQgd2hlbiBM
RVZFTCBJUlEgcmVxdWVzdGVkIikKPiBTaWduZWQtb2ZmLWJ5OiBNaW5nd2VpIFpoZW5nIDx6bXcx
MjMwNkBnbWFpbC5jb20+Cj4gU2lnbmVkLW9mZi1ieTogSmlhc2hlbmcgSmlhbmcgPGppYXNoZW5n
amlhbmdjb29sQGdtYWlsLmNvbT4KClBhdGNoIGFwcGxpZWQhCgpMb3RzIG9mIGl0ZXJhdGlvbnMg
YnV0IHRoZSBlbmQgcmVzdWx0IGxvb2tzIHJlYWxseSBnb29kLgoKWW91cnMsCkxpbnVzIFdhbGxl
aWoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgt
c3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5j
b20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8v
bGludXgtc3RtMzIK
