Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 05AB6A59A9F
	for <lists+linux-stm32@lfdr.de>; Mon, 10 Mar 2025 17:05:50 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A2D9CC78F9A;
	Mon, 10 Mar 2025 16:05:49 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com
 [209.85.128.51])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BBC70C7802E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 10 Mar 2025 16:05:48 +0000 (UTC)
Received: by mail-wm1-f51.google.com with SMTP id
 5b1f17b1804b1-43bdc607c3fso27030385e9.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 10 Mar 2025 09:05:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1741622748; x=1742227548;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1sBzCrcWxCos2ucPDzOy8rSIoDUK4uuBb9IVbzpXf6Y=;
 b=BDOzXY71ja0HB9ByGVzOIoJNOc+nmoh2mvt3PE9Km1S7+0FNmM/3pXr4r8cjPkYfXo
 PbTEbLv5NSlqkvtJ8lhoABzNqCrEI/t+3F24LsxYPs2QzvMaMBcX7GiQvLptksxtcRNE
 QtLr5TRRduJB+JgA/pxzmIZZsOPpCL7ZFXMk3iGdKe/LXSHxY9V0u8osF2WQI1DneGMG
 wYhrYuPW0T3fvX1TcHKiPT2impC10Ld9kpYmlR5TuR5GccFlg/Q9AK/SJTQqr0V+k6+T
 0HoKaFbM8mzUD6hfzTxJWMxDrUo9xKMjCOmv25cwp96Loi80ZQgWobPwD+UYvuPytMqQ
 lSMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741622748; x=1742227548;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1sBzCrcWxCos2ucPDzOy8rSIoDUK4uuBb9IVbzpXf6Y=;
 b=XnGQRoVaQcbI+mBnXTE6Nhn0mWsfDPh8eT6QAv+4UGHPy3HBSjf1lvmYV01/Hmiz+P
 3mZV6tYcxA8+UgfyugzppCdZboN3HjM5NlKqfE88+lQlS3I7cOc8l9UjRyt9OAuLRaEK
 DATa0JT39lghY4Woal1EeCOVyg+v5tEa1EuB7k34MHeCUgY+irWy3/XQTT2K7qPMpdnP
 sARVjLdDZLwo+6M5D0trVWmPhofwySXuQLX3pr1vPuoLn9FtC7bYlkmsUPuLqXsEQdT5
 BpQ88QFBzyVcL36SFlNl1ftwGlsF0BIg28YpiDxIGfEaOWdCh3SCU27YFVkLU+8BD6tm
 J2dw==
X-Forwarded-Encrypted: i=1;
 AJvYcCX+0M685cWrvEW2fWgZVDDSU9TNg4l68D5wJaTecFl7+jFXkBSdnsZwNl7kE62+yxqho1yUIeV9tKcHsQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YzbADS81khoRHCq5kCPmxAmzBghyy+wfiPaKdst3L7MPseRcYmy
 eWPpJQNUwTWy09AY/XgeJMsvjuMTG8JDeAuKUXTKtNFK+rTA9VJA
X-Gm-Gg: ASbGncuexnL7ThE2HvEBzPLWoujmZx5K+HuWGMVghGFLZL2LKgjZ2hCaNxXwmOon3im
 /wV4Q65y5TngMJamOH73UN53gnjtCC1cAQZi3k95LNf9JlAgfSYkhZLyyzwREHxLH9WaXtUArXb
 yeO6ozGstLGQDXy3xp3eYDOAq8DrmDa4SiB/wBGgYodDFLh4sVulbkkgiGnLAlZBjxFXSE1K+Fb
 Y5mE/uOyRaBN5ANsm0DdYRP0Q/naNkebEWROtgNaWdcfrZFtbglgeJIS35+oHpjg0Cr9MB6LAca
 cKk1jLUwaVIYb3KOGq54YMaUUB2y7sbhPVMZjjYEyh2oYqs9Ht/FmjPt98G0SdbMs5i3Juop9sV
 Oa/VpKSq1yd9az4jsxFxb
X-Google-Smtp-Source: AGHT+IH1HHf+1OpwkvFsYArfklWxYPjgWRGPYO6MW19aTR4oUCtXkTsxgz2AKwy1itY/6jY/cI2jWA==
X-Received: by 2002:a05:6000:410a:b0:391:4559:8761 with SMTP id
 ffacd0b85a97d-39145598929mr2906294f8f.36.1741622747749; 
 Mon, 10 Mar 2025 09:05:47 -0700 (PDT)
Received: from jernej-laptop.localnet (86-58-6-171.dynamic.telemach.net.
 [86.58.6.171]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43cfa0723c9sm34686035e9.6.2025.03.10.09.05.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Mar 2025 09:05:47 -0700 (PDT)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
 "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Date: Mon, 10 Mar 2025 17:05:45 +0100
Message-ID: <2774218.mvXUDI8C0e@jernej-laptop>
In-Reply-To: <E1trbyF-005qYl-Lu@rmk-PC.armlinux.org.uk>
References: <Z87WVk0NzMUyaxDj@shell.armlinux.org.uk>
 <E1trbyF-005qYl-Lu@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
Cc: Eric Dumazet <edumazet@google.com>,
 linux-stm32@st-md-mailman.stormreply.com, Jerome Brunet <jbrunet@baylibre.com>,
 Samuel Holland <samuel@sholland.org>, Kevin Hilman <khilman@baylibre.com>,
 Chen-Yu Tsai <wens@csie.org>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, linux-sunxi@lists.linux.dev,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-arm-msm@vger.kernel.org, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, netdev@vger.kernel.org,
 Andrew Lunn <andrew+netdev@lunn.ch>, Vinod Koul <vkoul@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 "David S. Miller" <davem@davemloft.net>
Subject: Re: [Linux-stm32] [PATCH net-next 9/9] net: stmmac: sunxi: remove
	of_get_phy_mode()
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

RG5lIHBvbmVkZWxqZWssIDEwLiBtYXJlYyAyMDI1IG9iIDEzOjEwOjU5IFNyZWRuamVldnJvcHNr
aSBzdGFuZGFyZG5pIMSNYXMgamUgUnVzc2VsbCBLaW5nIChPcmFjbGUpIG5hcGlzYWwoYSk6Cj4g
ZGV2bV9zdG1tYWNfcHJvYmVfY29uZmlnX2R0KCkgYWxyZWFkeSBnZXRzIHRoZSBQSFkgbW9kZSBm
cm9tIGZpcm13YXJlLAo+IHdoaWNoIGlzIHN0b3JlZCBpbiBwbGF0X2RhdC0+cGh5X2ludGVyZmFj
ZS4gVGhlcmVmb3JlLCB3ZSBkb24ndCBuZWVkIHRvCj4gZ2V0IGl0IGluIHBsYXRmb3JtIGNvZGUu
Cj4gCj4gU2V0IGdtYWMtPmludGVyZmFjZSBmcm9tIHBsYXRfZGF0LT5waHlfaW50ZXJmYWNlLgo+
IAo+IFNpZ25lZC1vZmYtYnk6IFJ1c3NlbGwgS2luZyAoT3JhY2xlKSA8cm1rK2tlcm5lbEBhcm1s
aW51eC5vcmcudWs+CgpBY2tlZC1ieTogSmVybmVqIFNrcmFiZWMgPGplcm5lai5za3JhYmVjQGdt
YWlsLmNvbT4KCkJlc3QgcmVnYXJkcywKSmVybmVqCgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0
bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0
b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
