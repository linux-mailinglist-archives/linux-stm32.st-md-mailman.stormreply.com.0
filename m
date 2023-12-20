Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CFC2C81AA99
	for <lists+linux-stm32@lfdr.de>; Thu, 21 Dec 2023 00:01:06 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 82B1CC6B477;
	Wed, 20 Dec 2023 23:01:06 +0000 (UTC)
Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com
 [209.85.219.178])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 26FC7C6A5EA
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 20 Dec 2023 23:01:05 +0000 (UTC)
Received: by mail-yb1-f178.google.com with SMTP id
 3f1490d57ef6-dbd5b96b12eso202635276.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 20 Dec 2023 15:01:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1703113264; x=1703718064;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Kndbi6UPJxN6+T5jqZZQ14R7CnrzIl8QsQoFB2iMQDE=;
 b=CKkQWgTNWgW9B9VRMejGhkdBYSDA7MeesBCf/kt7Vg7e+SYqYioCg8sASnOwObsWc6
 +3SOi3xG2kNzo61mKiG2k71VZbBkq/ifADAXKTDgTn/8C47fWnlUk5aTFSfbawqSKEDX
 hIwgfIY6n2xCgjQDHI1fRi3pmsy0JkhYyIGmdaTvgF90OKtMcwmbwCg3Jen9kWq1eHtu
 z0FH7DMP4b/d8/BCLfV9wIoOvLlGKWDQZ5h7KNsfDcU12pKj5drOZcWouRO1tkwc6xKx
 Fv6qkYuRGbqSF37uPRhtVQNnBIAnQVzpVWW4VO0C1mT+NTTgKZdM/bc093zAO97I6a4i
 3HIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1703113264; x=1703718064;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Kndbi6UPJxN6+T5jqZZQ14R7CnrzIl8QsQoFB2iMQDE=;
 b=uduJtIrjQrwq5eDPG3xJXlDfRC77MLqSL+aH95JhhWhLAYErKZIOhUNKS7ZtWDwhmE
 ClBsbQy/uY0iF8tshczMD+xJef7CQSrT3/T9RX3U9YZRTFBms728U5Ikmi8IF8J5GHcN
 H0/TM7aPsmkOd6WtPIwlpwPnGqR6U0FQOB9vYLI83hvznLYEp/l9/4/ueU17y5m1H5wh
 unYgcPjpRdkYfoBiHTxVsmJrtYRsv+v5EdnbG9etnP/t1k+a249U30fISISV6H4whDOh
 a9MA9XcZXdcTf7tQzbsrDQuCY31qVoihGa546roVh7wrYgERoYpSKyuXcUKO/TfD2X6d
 fmXA==
X-Gm-Message-State: AOJu0Yw55GNW8SWFMV8g9xhXc//py0dccwuIZ4qIHwruxye8FO9HxMKy
 azgmGBPNU9a9hCtQB+czpFuIMgk1yDi/7bPe9t+fOg==
X-Google-Smtp-Source: AGHT+IEKvmNUg9bRCaiTBW2ffBMNHNVTN+PuEE8H2zvBjctHE6yEmrhyKhMQv1uFbhEhkvf1gN/e/9FOCU9KjjJHZtc=
X-Received: by 2002:a25:aab4:0:b0:dbd:739c:48ef with SMTP id
 t49-20020a25aab4000000b00dbd739c48efmr495214ybi.19.1703113263987; Wed, 20 Dec
 2023 15:01:03 -0800 (PST)
MIME-Version: 1.0
References: <20231218162326.173127-1-romain.gantois@bootlin.com>
 <20231218162326.173127-2-romain.gantois@bootlin.com>
 <20231219122034.pg2djgrosa4irubh@skbuf>
 <20231219140754.7a7a8dbd@device-28.home>
 <CACRpkdaxy9u=1-rQ+f+1tb8xyV-GYOuq52xhb4_SRPk9-LpnUA@mail.gmail.com>
 <20231219172932.13f4b0c3@device-28.home>
 <20231219224616.pw32w5eq2dbuja5i@skbuf>
 <CACRpkdbo=Oem4PCOtSV6iWJoojRetTgZhx7J91uecTa-DQA8iQ@mail.gmail.com>
In-Reply-To: <CACRpkdbo=Oem4PCOtSV6iWJoojRetTgZhx7J91uecTa-DQA8iQ@mail.gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 21 Dec 2023 00:00:52 +0100
Message-ID: <CACRpkdY2U-SmNZ=52qTFBcYtqe63MHdBY=FUFitfBfjb3aYeBQ@mail.gmail.com>
To: Vladimir Oltean <olteanv@gmail.com>
Cc: Richard Tresidder <rtresidd@electromag.com.au>,
 Pascal EBERHARD <pascal.eberhard@se.com>,
 Romain Gantois <romain.gantois@bootlin.com>, netdev@vger.kernel.org,
 Sylvain Girard <sylvain.girard@se.com>,
 linux-stm32@st-md-mailman.stormreply.com, stable@vger.kernel.org,
 Eric Dumazet <edumazet@google.com>, Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net 1/1] net: stmmac: Prevent DSA tags
	from breaking COE
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

T24gV2VkLCBEZWMgMjAsIDIwMjMgYXQgMTo0M+KAr0FNIExpbnVzIFdhbGxlaWogPGxpbnVzLndh
bGxlaWpAbGluYXJvLm9yZz4gd3JvdGU6Cgo+IFRoZW4gZm9yICp0aGlzKiBkcml2ZXIgSSBuZWVk
IHRvIGNoZWNrIGZvciB0aGUgZXRoZXJ0eXBlCj4gRVRIX1BfODAyMVEgd2hhdCBpcyBpbnNpZGUg
aXQsIG9uZSBsZXZlbCBkb3duLCBhbmQgdGhhdCBpcyBhCj4gc2VwYXJhdGUgaGVscGVyLiBBbmQg
SSBuYW1lZCBpdCBza2Jfdmxhbl9yYXdfaW5uZXJfZXRoZXJ0eXBlKCkKPiBJdCB3aWxsIHJldHJp
ZXZlIHRoZSBpbm5lciB0eXBlIG5vIG1hdHRlcgo+Cj4gaW5jbHVkZS9saW51eC9pZl92bGFuLmgK
Pgo+ICsvKiBUaGlzIGRldGVybWluZXMgdGhlIGlubmVyIGV0aGVydHlwZSBpbmNvZGVkIGludG8g
dGhlIHNrYiBkYXRhIHdpdGhvdXQKPiArICogcmVseWluZyBvbiBza2ItPnByb3RvY29sIHdoaWNo
IGlzIG5vdCBhbHdheXMgaWRlbnRpY2FsLgo+ICsgKi8KPiArc3RhdGljIGlubGluZSB1MTYgc2ti
X3ZsYW5fcmF3X2lubmVyX2V0aGVydHlwZShjb25zdCBzdHJ1Y3Qgc2tfYnVmZiAqc2tiKQo+ICt7
Cj4gKyAgICAgICBzdHJ1Y3Qgdmxhbl9ldGhoZHIgKnZoZHI7Cj4gKwo+ICsgICAgICAgaWYgKCFz
a2JfcG9pbnRlcl9pZl9saW5lYXIoc2tiLCAwLCBWTEFOX0VUSF9ITEVOKSkKPiArICAgICAgICAg
ICAgICAgcmV0dXJuIDB4MDAwMFU7Cj4gKwo+ICsgICAgICAgdmhkciA9IHZsYW5fZXRoX2hkcihz
a2IpOwo+ICsgICAgICAgcmV0dXJuIG50b2hzKHZoZHItPmhfdmxhbl9lbmNhcHN1bGF0ZWRfcHJv
dG8pOwo+ICt9Cj4KPiAoV2UgY2FuIGJpa2VzaGVkIHRoZSBuYW1lIG9mIHRoZSBmdW5jdGlvbi4g
Kl9pbm5lcl9wcm90b2NvbCBtYXliZS4pCj4KPiBJdCBkb2VzIG5vdCBoYW5kbGUgbmVzdGVkIFZM
QU5zIGFuZCBJIGRvbid0IHNlZSB3aHkgaXQgc2hvdWxkIHNpbmNlCj4gdGhlIGltbWVkaWF0ZSBz
aWJsaW5ncyBpbiBpZl92bGFuLmggZG9lcyBub3QsIGkuZS4KPiB2bGFuX2V0aF9oZHIoKSwgc2ti
X3ZsYW5fZXRoX2hkcigpLiBJdCdzIHByZXR0eSBjbGVhciB0aGVzZSBoZWxwZXJzCj4gYWxsIGdv
IGp1c3Qgb25lIGxldmVsIGRvd24uIChXZSBjYW4gYWRkIGEgKl9kZXNjZW5kXyooKQo+IGhlbHBl
ciB0aGUgZGF5IHNvbWVvbmUgbmVlZHMgdGhhdC4pCgpGb3JnZXQgdGhpcyB3aG9sZSBkaXNjdXNz
aW9uIGJlY2F1c2UgaW4gPGxpbnV4L2lmX3ZsYW4uaD4KdGhlcmUgaXMgYWxyZWFkeSB2bGFuX2dl
dF9wcm90b2NvbCgpIGFuZCB2bGFuX2dldF9wcm90b2NvbF9hbmRfZGVwdGgoKQpzbyB0aGlzIHBy
b2JsZW0gaXMgYWxyZWFkeSBzb2x2ZWQsIGp1c3QgYmV0dGVyLgoKWW91cnMsCkxpbnVzIFdhbGxl
aWoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgt
c3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5j
b20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8v
bGludXgtc3RtMzIK
