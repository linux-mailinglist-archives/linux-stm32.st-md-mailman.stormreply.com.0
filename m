Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A8A4293DA08
	for <lists+linux-stm32@lfdr.de>; Fri, 26 Jul 2024 22:52:11 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6511AC78018;
	Fri, 26 Jul 2024 20:52:11 +0000 (UTC)
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com
 [209.85.167.50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5BC74C71280
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 26 Jul 2024 20:52:04 +0000 (UTC)
Received: by mail-lf1-f50.google.com with SMTP id
 2adb3069b0e04-52efa9500e0so2129124e87.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 26 Jul 2024 13:52:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1722027123; x=1722631923;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JI5ZgaYoPgocYBo33Z1jABDgbCrXDHkgPxPPgMs9nV8=;
 b=TOt0xGuMA4zXgXmOW8ts0Lrb5wzua30sMc1QFXlckgpEQP6yLwPoz2iotikvlRb0y2
 Ug+GFYRRIy25bxta0qu1g+PoSawUmj5QxIu8qYNIWC6PKUn6osa5XO1tjmbuUgCwewbq
 QoaYMB3zChlvAfMZDnPoSLYX8C+9onbI8Wr8uAdmVrkiJuvLbtj5As46aAxJQhakh2NY
 YryHuxSriXZ0xkeMTgO+8cReatRR5PIq94dzA8Wt0zaLvr7244S4SbspLk1GQcAH3LfI
 ckR4ApQrN4caK9nInNiumW3C88WB3YhvmP66Xt2P8b1Ez+T7q1DyIDP9w9gJCdveTHBW
 zqQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1722027123; x=1722631923;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=JI5ZgaYoPgocYBo33Z1jABDgbCrXDHkgPxPPgMs9nV8=;
 b=MAT9rbkGzPx9C9+U8VS+hq0Ffs9OGqxd8ujuN9Ow0WTNCpVOM4lNoOyo1/+aWn7Cp+
 3vvg7gXkX6RJlicN2f0VQWdOGxisfNWGTkHx6uxdSsJDTcfvcWxokdx23fLj+lR9UF/V
 1katHRL790hmvp//c9A3jCLQui9Bm+efBoqWVc2P8+OewBdhfgJwi66DDv9mRup/K5N1
 g8FcdxDCbqo+5xh+MhO450kmsYNDTvGT3fXtmKP6fE9EvQHWZkHsvJbrO92X00Lvp86d
 Uam3eYMLKPajbhBdhBLEhX3nQm5bkEAy1zrQM8CWIiHN2nw6aQ959hArft/4fW3vlmSE
 KNpQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCURskiFq+aCQWhiXwByd+wwyZbgr0Ovv7TRYwoChdDKFnqVKxCloxOWhXpF4Euvt43MULhob1l8dGe+mJQXw9IJUtUDcvXntkPgN79HBAqMnGgSIxGriKEI
X-Gm-Message-State: AOJu0YxBvEvk5H5A05FtY7AcRGgGq9xMYJeP2j8J2577eHxrQ2PbyYE9
 IR7KaKURF5G1WjYuwYTo/yeIuubfzNED42jQWBZVMk5YDQiyZwvef/myj38yPxZMliQqpEJzpTk
 OBRjsCNLB4k+K5BUJ8vl4L5oTkB7QpF966MwHvw==
X-Google-Smtp-Source: AGHT+IH/KQBHFp7cfJBihyPHNXUeZIXrpWHpjT5Yz8yFUhjBSqezUgduigKjzduYz++qkwRoe4y39Ba5yjD6sVnh/bE=
X-Received: by 2002:a05:6512:2c94:b0:52c:9e82:a971 with SMTP id
 2adb3069b0e04-5309b25a25bmr604398e87.7.1722027123520; Fri, 26 Jul 2024
 13:52:03 -0700 (PDT)
MIME-Version: 1.0
References: <20240722160022.454226-1-valentin.caron@foss.st.com>
 <20240722160022.454226-5-valentin.caron@foss.st.com>
In-Reply-To: <20240722160022.454226-5-valentin.caron@foss.st.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 26 Jul 2024 22:51:51 +0200
Message-ID: <CACRpkdaSb0T3ZH8+oQNHXddSg9gS-u+6-etggqNK36sNR7nN0Q@mail.gmail.com>
To: Valentin Caron <valentin.caron@foss.st.com>
Cc: linux-rtc@vger.kernel.org, Rob Herring <robh@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v3 4/4] rtc: stm32: add alarm A out feature
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
bi5jYXJvbkBmb3NzLnN0LmNvbT4gd3JvdGU6Cgo+IFNUTTMyIFJUQyBjYW4gcHVsc2Ugc29tZSBT
T0MgcGlucyB3aGVuIGFuIFJUQyBhbGFybSBleHBpcmVzLgo+IFRoaXMgcGF0Y2ggYWRkcyB0aGlz
IGZ1bmN0aW9uYWxpdHkgZm9yIGFsYXJtIEEuIFRoZSBwdWxzZSBjYW4gb3V0IG9uIHRocmVlCj4g
cGlucyBSVENfT1VUMSwgUlRDX09VVDIsIFJUQ19PVVQyX1JNUCAoUEMxMywgUEIyLCBQSTggb24g
c3RtMzJtcDE1KQo+IChQQzEzLCBQQjIsIFBJMSBvbiBzdG0zMm1wMTMpIChQQzEzLCBQRjQvUEY2
LCBQSTggb24gc3RtMzJtcDI1KS4KPgo+IFRoaXMgcGF0Y2ggb25seSBhZGRzIHRoZSBmdW5jdGlv
bmFsaXR5IGZvciBkZXZpY2VzIHdoaWNoIGFyZSB1c2luZwo+IHN0LHN0bTMybXAxLXJ0YyBhbmQg
c3Qsc3RtMzJtcDI1LXJ0YyBjb21wYXRpYmxlLgo+Cj4gQWRkICJhbGFybS1hIiBpbiBwaW5tdXgg
ZnVuY3Rpb25zLgo+Cj4gU2lnbmVkLW9mZi1ieTogVmFsZW50aW4gQ2Fyb24gPHZhbGVudGluLmNh
cm9uQGZvc3Muc3QuY29tPgoKTG9va3MgZ29vZCB0byBtZToKUmV2aWV3ZWQtYnk6IExpbnVzIFdh
bGxlaWogPGxpbnVzLndhbGxlaWpAbGluYXJvLm9yZz4KCllvdXJzLApMaW51cyBXYWxsZWlqCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMy
IG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0
dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LXN0bTMyCg==
