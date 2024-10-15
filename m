Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DBF5B99DFD2
	for <lists+linux-stm32@lfdr.de>; Tue, 15 Oct 2024 09:56:06 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 83A74C7801A;
	Tue, 15 Oct 2024 07:56:06 +0000 (UTC)
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com
 [209.85.167.50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CADE6C78013
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 15 Oct 2024 07:56:04 +0000 (UTC)
Received: by mail-lf1-f50.google.com with SMTP id
 2adb3069b0e04-539e5c15fd3so2594970e87.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 15 Oct 2024 00:56:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1728978964; x=1729583764;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=W4f2iJU2YRRvkqlQGmRp0NrctfUTlxD5uwwI+OoQ05k=;
 b=iW6AnB5rmEPV+yKidnVc35VJyjFzrxgSsGWU/dSwAOD5iYLUBA9jTg37L3cgdnaD2j
 EF9FatVLSL6at506DqBICOWOmfahVxnREmylbTrFrZCayzqgNA6mOiQwazDRmVdHbjJP
 klJ7DBe+Qfo3RhiBjBEl19IWZrXa4ASb7zfKeo65TsZBCH2p6kbzRj6K7LT6wg2fAknT
 p9RARCIm0Yw2vStTq5B9DkD8OijDpYC7trNcB5M+g9s2EdmkWGbzWqhgRRUY/5q7RJ1+
 Y42p8gp/ozmqCtMWoHOr7hVrIg4FAujMqaUhp1gQy99w6qd/Uc/7WyLQKn+CcFfokmkt
 XPhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728978964; x=1729583764;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=W4f2iJU2YRRvkqlQGmRp0NrctfUTlxD5uwwI+OoQ05k=;
 b=tYnVpRanKbTFBoVRHtFedoA+2Xt4s8zLWUz81eacSBazANP4dZ/RU3DCPltMIb1tES
 H9SXXh3vlyhL6MPq3jKw3ITP1GmepE818i4oww2NBiw7kPS0cwnAc+W/CIZEHIpEvRKG
 W/4w7kQHuTq2YdXRtb6gpy2uW2hKFtGspTG/tVIbjreQ5yK5T9y9S6dqGYcqpPWeuQlO
 E6oEkT0YLn+v9+Sttx1VDpxYLb7IYDnmgZuI4+s0Uy1ic4sp+4IzEQYYRWmksD7upEgW
 4wM62KKTJ2duj9M2/329CMhcp9W8fAVwVVwpTwfwc1ijo1W2a7/u9TUA1D5LMPLx0I0G
 sTsg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUrdR2y9rzJTrEdeMp3esfEo5rY3jhyox++EaymH67B6bT30qgx0vFRy3UG6Gd6eJ9h0eIwSYUC4E3ZUA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YztTdqLWPLIHNR1mDM312djmRDkKAL0N5q4OnqsvHvUZ6gZiWUg
 w0LykfaY08vaURfS5ljYM5rF6KuzpIL8L3uJXNT9kyZXIsf+nPIBJCDQFOG5YidPeiTtNccZ2MG
 JTeh83qHG1KqGn5WRG1REhhRepc+Rny28vne1Mw==
X-Google-Smtp-Source: AGHT+IGxQoVV1qAm1koIq8EsNt09kbaJ+UbkKc4EVXnZTt6xt0Ql1TEN5rxOvW8w3QwasQCGnoEZst65gfgN3WuoTY4=
X-Received: by 2002:a05:6512:695:b0:539:f37f:bed9 with SMTP id
 2adb3069b0e04-539f37fc164mr3497720e87.8.1728978963859; Tue, 15 Oct 2024
 00:56:03 -0700 (PDT)
MIME-Version: 1.0
References: <a1a1d062-f3a2-4d05-9836-3b098de9db6d@foss.st.com>
In-Reply-To: <a1a1d062-f3a2-4d05-9836-3b098de9db6d@foss.st.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 15 Oct 2024 09:55:52 +0200
Message-ID: <CACRpkdaMMsHXkgcOtw0aC=SPfJJURCyCgzDq-rEXrBGaM44Sdg@mail.gmail.com>
To: Clement LE GOFFIC <clement.legoffic@foss.st.com>
Cc: Kees Cook <kees@kernel.org>, linux-stm32@st-md-mailman.stormreply.com,
 Russell King <linux@armlinux.org.uk>, linux-kernel@vger.kernel.org,
 "Russell King \(Oracle\)" <rmk+kernel@armlinux.org.uk>,
 Mark Brown <broonie@kernel.org>, Ard Biesheuvel <ardb@kernel.org>,
 linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: Re: [Linux-stm32] Crash on armv7-a using KASAN
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

SGkgQ2xlbWVudCwKCnRoYW5rcyBmb3IgeW91ciByZXBvcnQhIEkgbG9va2VkIGEgYml0IGF0IGl0
OgoKT24gTW9uLCBPY3QgMTQsIDIwMjQgYXQgMzoyMeKAr1BNIENsZW1lbnQgTEUgR09GRklDCjxj
bGVtZW50LmxlZ29mZmljQGZvc3Muc3QuY29tPiB3cm90ZToKCj4gSSBoYXZlIGRldGVjdGVkIGEg
a2VybmVsIGNyYXNoIGluIGxhdGVzdCBrZXJuZWwgb24gYXJtdjctYSB3aGVuIEthc2FuIGlzCj4g
ZW5hYmxlZC4KKC4uLikKPiBDcmFzaCBsb2cgd2l0aCByZWNlbnQga2VybmVsICh2Ni4xMi1yYzMp
IDoKPgo+IH4gIyBJbnN1ZmZpY2llbnQgc3RhY2sgc3BhY2UgdG8gaGFuZGxlIGV4Y2VwdGlvbiEK
ClRoZSBjcmFzaCBsb29rcyBwcmV0dHkgImV4cGVjdGVkIiwgYXMgeW91IHNheSB5b3Ugc3RhcnQg
YSBsb3Qgb2YKcGFyYWxsZWwgcHJvY2Vzc2VzCmFuZCB3aG9vcHMsIHlvdSBydW4gb3V0IG9mIG1l
bW9yeSBvbiB0aGUgc3RhY2suIE5vIHNvZnR3YXJlIGNhbiBhZGQgbW9yZQptZW1vcnkgdG8gdGhl
IG1hY2hpbmUuCgpLQVNBTiB1c2VzIGEgbG90IG9mIGV4dHJhIG1lbW9yeSBmb3IgaW50ZXJjZXB0
aW5nIGFsbCBtZW1vcnkgYWNjZXNzZXMsCm5vbWluYWxseSBvbmUKZXh0cmEgYnl0ZSBwZXIgOCBi
eXRlcy4gVGhpcyBpcyBmdXJ0aGVyIHJlc3RyaWN0ZWQgYnkgdGhlIGNvbXBsZXgKbmF0dXJlIG9m
IHRoZSB2aXJ0dWFsCm1lbW9yeSBzcGFjZSBvbiBBUk0zMi4KClRoYXQgc2FpZCwgd2UgaW5jcmVh
c2UgdGhlIHNpemUgb2YgcGVyLXRocmVhZCBzdG9yYWdlIHdoZW4gdXNpbmcgS0FTQU4sClRIUkVB
RF9TSVpFX09SREVSIGlzIDIgaW5zdGVhZCBvZiAxLiBNYXliZSB0aGUgaW50ZXJydXB0IHN0YWNr
cyBuZWVkCnRvIGJlIHNjYWxlZCBzaW1pbGFybHkgdG8gbWFuYWdlIHRoZSBpbmNyZWFzZWQgbG9h
ZD8KCllvdXJzLApMaW51cyBXYWxsZWlqCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1t
ZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5
LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
