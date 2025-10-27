Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D89CFC11A27
	for <lists+linux-stm32@lfdr.de>; Mon, 27 Oct 2025 23:13:35 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9BDFAC628A0;
	Mon, 27 Oct 2025 22:13:35 +0000 (UTC)
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com
 [209.85.167.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E1E58C6048D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 27 Oct 2025 22:13:34 +0000 (UTC)
Received: by mail-lf1-f41.google.com with SMTP id
 2adb3069b0e04-592f3630b69so6290607e87.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 27 Oct 2025 15:13:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1761603214; x=1762208014;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mQTKJScatLYjbszW8Nmlz+tuTFmWhnW9yYaJmefda44=;
 b=cXmi8KnVehTTtkL43gfHcSlDuHi62w60ReqYyV7I7wCer5fFRRA6uvAZ17em6252vj
 RQU/YIE4Dp24fmjXrqKaLCcZejV2EbMZOE1LDw1je8lyFsaOYDsMzXyqg9Pq1Y+w2ikr
 rk1NRvpeyig0zYPP7z9jZ/QltCJUhbPSeXr1vpEaVNpLG95/++LpEN/xw6MHVDWaSjVK
 Rcmam+Jlzdo/9JyXZjZPwx65TrdxVb2/KEgvYc5oh6o39bxd8f6P303h0RxpIcDE5jfF
 K9Yk1L1QL5v9zzOrX24EVyC7OuBnemGb4lpZteoAJro4nGl/aI9IkATTA5q731S1FXwx
 I0aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761603214; x=1762208014;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mQTKJScatLYjbszW8Nmlz+tuTFmWhnW9yYaJmefda44=;
 b=PEGJUo4srn2+8lR9xVS9SAUEjPineRGcmLYpvGEB+pOUf5mCOifoS/5CspLujUPHVS
 pQO2PANW1NoTJCLaxSEqt5LWAMlOgD2V4qiFGQtPvSJCXYKzL7RWu4gMrleFkwCIGCQm
 Hn0z33sJ0M08563nr6YzbUf2S58vU0KAdL7WM8n00lhLfe+tOPkxnPA2Yt/69wb3EY72
 QpII3ao5H0Jmptx9v/z1Yg8dc/9VhEouiUp/ABCEniUa5AxJAyFuT7jdglSzIF2Cct7f
 98hkq2QU1A66aNjwZTqzPT2fB1bgrTExhQlB0MphyGxPYZ/NnTMJmU1S2yFtE3J1GsuJ
 CE7g==
X-Forwarded-Encrypted: i=1;
 AJvYcCW1XtNcfYdx+iwP57M0Znb76Zoq52O27EQqMrCopw9WdwEseZayhe2THHUqJDMG0cHiZlftkOMQUu1ocw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YzHF4jT0tJXA3ogPDslPDAVm1aaTCO6GKuv67gEN5plS00a9DSv
 Y7DEpFj7U3nmmiDKGNAVF7Wny9h88fEGGjbihMUeF9E8VhGTN+DYD/36Z/LGfoZLpKbh5rUrt4c
 RcC6vZ/ZlIHNbf3/O5ethQvOpdjvIH9bqSCKq/YLrLQ==
X-Gm-Gg: ASbGnctmCcL/CrpULRHnju9JMMQVdw/PsJwQ4a+ETP95meZMpK7IDrwAO7YiIIZvzuf
 rmQHeEhTn4vKPDi9zjeb67xszKycrY4PqWWasWXO7n2fRCfdlucVhPCAnh/Ft6oI8Iq2qk8EyF7
 RpH+A2ytioKRZq1mF/HMwEodBsCqcqPnSQJMke6o3RK2zWy5oKvSwX4X/daKretN13JgQIBTGQz
 DSGfd5ntPopo7iiV6bAQ70rJ33w+fTNJd4abujyZX1MO2c1uz02sw4H0vz264kMGHerwWHY5vdG
 zqYL0g==
X-Google-Smtp-Source: AGHT+IGiyuhAd/g3j8DFK8VW5m7bOjesol+1DXV+h5pePcwa0TlxwvPOrfmVLR7Li8szmQf8I82fLHqa33iH+2F8eRE=
X-Received: by 2002:a05:6512:ea1:b0:586:8a68:9c4d with SMTP id
 2adb3069b0e04-5930e9dd17cmr516262e87.52.1761603214129; Mon, 27 Oct 2025
 15:13:34 -0700 (PDT)
MIME-Version: 1.0
References: <20251023132700.1199871-1-antonio.borneo@foss.st.com>
 <20251023132700.1199871-8-antonio.borneo@foss.st.com>
In-Reply-To: <20251023132700.1199871-8-antonio.borneo@foss.st.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 27 Oct 2025 23:13:23 +0100
X-Gm-Features: AWmQ_bnPVCXY1Dpjano01hZ_Z8pqJmAtt3_jZEXugTZ4oHs4-VjsvtZbv--6EHg
Message-ID: <CACRpkda1d+WquYsUq-ntWRC0J37w6=UBcSSAwL_nroS4_h_dZw@mail.gmail.com>
To: Antonio Borneo <antonio.borneo@foss.st.com>
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 devicetree@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>,
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
 Fabien Dessenne <fabien.dessenne@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 Christophe Roullier <christophe.roullier@foss.st.com>
Subject: Re: [Linux-stm32] [PATCH v4 07/12] pinctrl: stm32: Drop useless
	spinlock save and restore
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

T24gVGh1LCBPY3QgMjMsIDIwMjUgYXQgMzoyN+KAr1BNIEFudG9uaW8gQm9ybmVvCjxhbnRvbmlv
LmJvcm5lb0Bmb3NzLnN0LmNvbT4gd3JvdGU6Cgo+IFRoZXJlIGlzIG5vIG5lZWQgdG8gYWNxdWly
ZSBhIHNwaW5sb2NrIHRvIG9ubHkgcmVhZCBhIHJlZ2lzdGVyIGZvcgo+IGRlYnVnZnMgcmVwb3J0
aW5nLgo+IERyb3Agc3VjaCB1c2VsZXNzIHNwaW5sb2NrIHNhdmUgYW5kIHJlc3RvcmUuCj4KPiBT
aWduZWQtb2ZmLWJ5OiBBbnRvbmlvIEJvcm5lbyA8YW50b25pby5ib3JuZW9AZm9zcy5zdC5jb20+
CgpQYXRjaCBhcHBsaWVkIQoKWW91cnMsCkxpbnVzIFdhbGxlaWoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0Ckxp
bnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWls
bWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
