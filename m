Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A86B7281B6
	for <lists+linux-stm32@lfdr.de>; Thu,  8 Jun 2023 15:49:34 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 973D9C6905A;
	Thu,  8 Jun 2023 13:49:33 +0000 (UTC)
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com
 [209.85.128.170])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 898B8C62EFE
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  8 Jun 2023 13:49:32 +0000 (UTC)
Received: by mail-yw1-f170.google.com with SMTP id
 00721157ae682-565ee3d14c2so5295317b3.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 08 Jun 2023 06:49:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1686232171; x=1688824171;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=P56s/voLHkz9fUG5m5v1nOf0525Duw0HPDuYpPu2ReM=;
 b=XQhaWUg4NNNWhrtz7+MZHk2QdA7s/roFGIVPLnK0vYjqjh0bnUgEo2bj1XZIgUQ1iA
 /e+9m0k+DrUY8JkV1xE1yv4VkTJYISmVh4fZEQUYMGXd3uDm3A0F2QNa12MUwEd2jlDg
 7WIFGFhYWGhdcV59xU9cyzkjmzNzS9RWhx1KkPeb6FaGt1XQFB+UknIhvmO98iBUvr0s
 yptENh3XywYJfFYIgq5hLBEsnATCPLUOtme1aZr7fEeSod0VgIU73cDzB9mSz1SD/XF8
 v+te5N51IxfMSiEgb2Q9gwdSNOvayRUwrObVswhRUzurqlWZWFz5HFS+8ktmGPhvg8w0
 JxWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686232171; x=1688824171;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=P56s/voLHkz9fUG5m5v1nOf0525Duw0HPDuYpPu2ReM=;
 b=W+lFcPxNVuNEXqSa/uBrEMQfpPNakJi8o6t++L8Lu/HDYTuAEzib6S5qZcX8Eu2JDC
 c5SHsJg91EBbZJGVOwrtFAXZgdXhkYYjMNWVZRNtahWaNG+ycywpIxDwDonJy8FcYZsI
 EAlFZ4p3hQZDMUhupUw97UOnUTIPCf4Tm/ndriaidfrqMsSfIVHTs5No6nr97GmtOV4f
 GYzcxkU8gWjc0wFhTQUJGmIgvDVBRBKoS7yAGxCc54qSdyvcnV6RNFaFydO7pG44bY2d
 +QmP1LyWbhxHcI8AjcRW0e8rQ1F7OTyBmJc/Wnyi2DokvDEYVMLcvADu6wMBuGyDQMt3
 rEvQ==
X-Gm-Message-State: AC+VfDzgjjq85xklh+vGHy9laAc5bOz+nOnmvDhwEYJN5O+WNIKWbWNC
 /lLKaxO1/hFD2QUtnGDBwmKtjN5t8V4wTTkftk82hg==
X-Google-Smtp-Source: ACHHUZ5eXsDecBMtO7ySuimFpWWeTqFYH2re76w5Dnn1LSeeXWU9A3vaOUQvV936Dz7XNFemSfa1s4dg08eO7ndqpLw=
X-Received: by 2002:a0d:df49:0:b0:55a:ad0a:76c with SMTP id
 i70-20020a0ddf49000000b0055aad0a076cmr10808163ywe.18.1686232171381; Thu, 08
 Jun 2023 06:49:31 -0700 (PDT)
MIME-Version: 1.0
References: <20230602132859.16442-1-alexandre.torgue@foss.st.com>
 <20230602132859.16442-2-alexandre.torgue@foss.st.com>
In-Reply-To: <20230602132859.16442-2-alexandre.torgue@foss.st.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 8 Jun 2023 15:49:18 +0200
Message-ID: <CACRpkdZEEq_hL5OxVu16SZL4tKgFjXNZpFLuUxmeo96rrPMsYQ@mail.gmail.com>
To: Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Arnd Bergmann <arnd@arndb.de>, Catalin Marinas <catalin.marinas@arm.com>,
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, soc@kernel.org,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 Olof Johansson <olof@lixom.net>, Will Deacon <will@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2 01/10] dt-bindings: pinctrl: stm32:
 support for stm32mp257 and additional packages
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

T24gRnJpLCBKdW4gMiwgMjAyMyBhdCAzOjI54oCvUE0gQWxleGFuZHJlIFRvcmd1ZQo8YWxleGFu
ZHJlLnRvcmd1ZUBmb3NzLnN0LmNvbT4gd3JvdGU6Cgo+IEFkZCBzdXBwb3J0IGZvciBzdCxzdG0z
Mm1wMjU3LXBpbmN0cmwgYW5kIHN0LHN0bTMybXAyNTctei1waW5jdHJsLgo+IEFkZCBwYWNrYWdl
cyBBSSwgQUsgYW5kIEFMICh2YWx1ZXMgOiAweDEwMCwgMHg0MDAgYW5kIDB4ODAwKQo+Cj4gU2ln
bmVkLW9mZi1ieTogQWxleGFuZHJlIFRvcmd1ZSA8YWxleGFuZHJlLnRvcmd1ZUBmb3NzLnN0LmNv
bT4KPiBSZXZpZXdlZC1ieTogQ29ub3IgRG9vbGV5IDxjb25vci5kb29sZXlAbWljcm9jaGlwLmNv
bT4KClJldmlld2VkLWJ5OiBMaW51cyBXYWxsZWlqIDxsaW51cy53YWxsZWlqQGxpbmFyby5vcmc+
CgpZb3VycywKTGludXMgV2FsbGVpagpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQt
bWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5j
b20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
