Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 515C893D9FB
	for <lists+linux-stm32@lfdr.de>; Fri, 26 Jul 2024 22:46:59 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0466AC78018;
	Fri, 26 Jul 2024 20:46:59 +0000 (UTC)
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com
 [209.85.167.52])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 478B1C71280
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 26 Jul 2024 20:46:52 +0000 (UTC)
Received: by mail-lf1-f52.google.com with SMTP id
 2adb3069b0e04-52ef95ec938so2177084e87.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 26 Jul 2024 13:46:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1722026811; x=1722631611;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kZXkbU8q+Zt3SnwgAk8/hFQnwK7ueMI7bqu+1Re++d0=;
 b=asv9EXezusf4KOwpbw/joMk2WXknEFDuHKtNyG6c0QjR2HONCuU63rRP5m/eHg+MHX
 h6TPNX007/dB/f3yxqdVIi7Lc/mTGEXUbo47C6C1T3xbaLuz1wRZKAv8xkiB2mQUd7rZ
 uuEldIHFB7ZELduquLcGlQ3fg+7IzXJQVWe/uQAmQIudZHfd3I5lcrosq6koHQnw3Wzn
 /chvx4iRRdSBK5+JN3qUj+cd/8HpvZ7PyVKArLmxbHIVp8rZDHjYut9UiBa+johVljO2
 bR51pO91cQtlvgRKP/FTn/JDkZRpz4ClKKzi2AFh6pYKfCTWlIxnuyME/I3SIWTmCbMz
 mJXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1722026811; x=1722631611;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=kZXkbU8q+Zt3SnwgAk8/hFQnwK7ueMI7bqu+1Re++d0=;
 b=Rvhx+Tca7dgrfLjBUQJtxwUUn65mUooi7rsuItekADn9stc9kZ0A5RJmt/DaHIzS3P
 yihWqLNsWVcgsNlI3qoVvOyppKXx7fm2xsuR9DADuweuCXRuUSqAw4w7AvkktTFI11Bl
 t305/RbrU/bEVfrzEfnM8/3hq/V9BBVWLO9FzP3YdjaHGL0JGiPFkxDKipdyyDMLlHx5
 27HptpF7/jenNaPYAA+tuv4m4khOuMXiAarRtvPZSGmYc3i1kiIX6x98Q9AvakJJ3Yp4
 tyg3fZE1CZbxmC0uM0vJbx0Lqr8xv8Bprer2Bz9cAfoRDgWS2rmu+G3fL0eWneGG7yId
 8fIg==
X-Forwarded-Encrypted: i=1;
 AJvYcCW+pE+kv22Jp8K+Id2H98gjNdTxnBuxdwsn3wlNWWBXHDcNUUz3AmaMrOEC91leETmohk5p4QCr6LzlYgQ7/BldN6Z5iyw+iqjgoVN4QaVzqba9Cqg/1zJa
X-Gm-Message-State: AOJu0YwF5xh4kLucxq4nxVuFdfwmshsC9vKUTK7Ysos7UjB39KJuj4rG
 G0GQaVvtcCQg0t7t5b8iXLOdmCtbCCo7JbBzViFUSt2k89eRC5CBcOibCud9CnxpqbzIF9pMcXY
 4Yt1M9yxW/zSmUS8HVRY116Ziq8XfMSKiqXjVxA==
X-Google-Smtp-Source: AGHT+IGtk2Ynpj/GJYUcsbK8mhjqd1a3MpqdYpelqVYrMrT58LYio/Tlrul5HfHB3aAXXNe3R6YeSxbB+rKUCRNWpio=
X-Received: by 2002:a05:6512:3e0e:b0:52c:c9bb:2ba4 with SMTP id
 2adb3069b0e04-5309b2b6e87mr649721e87.46.1722026811406; Fri, 26 Jul 2024
 13:46:51 -0700 (PDT)
MIME-Version: 1.0
References: <20240722160022.454226-1-valentin.caron@foss.st.com>
 <20240722160022.454226-3-valentin.caron@foss.st.com>
In-Reply-To: <20240722160022.454226-3-valentin.caron@foss.st.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 26 Jul 2024 22:46:40 +0200
Message-ID: <CACRpkdahF4uDux1Dh1XSh7nHusyGVD3sNu8TVB8HVu277vGLtg@mail.gmail.com>
To: Valentin Caron <valentin.caron@foss.st.com>
Cc: linux-rtc@vger.kernel.org, Rob Herring <robh@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v3 2/4] rtc: stm32: add pinctrl and pinmux
	interfaces
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

T24gTW9uLCBKdWwgMjIsIDIwMjQgYXQgNjowMuKAr1BNIFZhbGVudGluIENhcm9uCjx2YWxlbnRp
bi5jYXJvbkBmb3NzLnN0LmNvbT4gd3JvdGU6Cgo+IFNUTTMyIFJUQyBpcyBjYXBhYmxlIHRvIGhh
bmRsZSAzIHNwZWNpZmljIHBpbnMgb2YgdGhlIHNvYy4KPiAib3V0MSwgb3V0MiBhbmQgb3V0Ml9y
bXAiLiBUbyBoYW5kbGUgdGhpcywgd2UgdXNlIHBpbmN0cmwgZnJhbWV3b3JrLgo+IFRoZXJlIGlz
IGEgc2luZ2xlIHBpbiBwZXIgZ3JvdXAuCj4KPiBTaWduZWQtb2ZmLWJ5OiBWYWxlbnRpbiBDYXJv
biA8dmFsZW50aW4uY2Fyb25AZm9zcy5zdC5jb20+CiguLi4pCgo+ICsvKiBTVE0zMiBSVEMgcGlu
Y3RybCBoZWxwZXJzICovCj4gKyNkZWZpbmUgU1RNMzJfUlRDX1BJTk1VWChfbmFtZSwgX2FjdGlv
biwgLi4uKSB7IFwKPiArICAgICAgIC5uYW1lID0gKF9uYW1lKSwgXAo+ICsgICAgICAgLmFjdGlv
biA9IChfYWN0aW9uKSwgXAo+ICsgICAgICAgLmdyb3VwcyA9ICgoY29uc3QgY2hhciAqW10peyBf
X1ZBX0FSR1NfXyB9KSwgXAo+ICsgICAgICAgLm51bV9ncm91cHMgPSBBUlJBWV9TSVpFKCgoY29u
c3QgY2hhciAqW10peyBfX1ZBX0FSR1NfXyB9KSksIFwKPiArfQoKVGhpcyBpcyBhIHZlcnkgY2xl
dmVyIGFuZCBjbGVhbiBtYWNyby4KCldlIGhhdmUgUElOQ1RSTF9QSU5GVU5DVElPTigpIGluIDxs
aW51eC9waW5jdHJsL3BpbmN0cmwuaD4gd2hpY2ggaXNuJ3QKc21hcnQgZW5vdWdoIHRvIHVzZSBW
QV9BUkdTIGFuZCBBUlJBWV9TSVpFLgoKTm93IHlvdSBhbHNvIG5lZWQgLmFjdGlvbiBidXQgaWYg
aXQgd2Fzbid0IGZvciB0aGF0IEkgd291bGQgaGF2ZSBhc2tlZApmb3IgdGhlIG1hY3JvIHRvIGJl
IG1hZGUgZ2VuZXJpYy4KClRoZSBpbXBsZW1lbnRhdGlvbiBpcyBjbGVhbiBhbmQgaW1wZWNjYWJs
ZS4KUmV2aWV3ZWQtYnk6IExpbnVzIFdhbGxlaWogPGxpbnVzLndhbGxlaWpAbGluYXJvLm9yZz4K
CllvdXJzLApMaW51cyBXYWxsZWlqCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1t
YWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNv
bS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
