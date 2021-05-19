Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CB83388DF3
	for <lists+linux-stm32@lfdr.de>; Wed, 19 May 2021 14:24:07 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A332EC57B69;
	Wed, 19 May 2021 12:24:06 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com
 [209.85.221.44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 77259C57B5F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 19 May 2021 12:24:03 +0000 (UTC)
Received: by mail-wr1-f44.google.com with SMTP id v12so13813195wrq.6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 19 May 2021 05:24:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=Qmzj5sXb0dQGIp3IEqGvuU1Z+vJnbjFyzmJBniDVjRY=;
 b=wO9Fjndg3DsMOveXObNUhI/yN79ZZF6/0upv0Dkfj3WkTKw7wX30M394CafYendJ1n
 5qeCk2cbOIHr5nVytq8ZFa38S7TOjl7cvYGsIIZYmNei5JfE7xF/p5THZhMKnQbucd2D
 YSh13zo4fhx4a/Rt3+qKbLlKvQkfTO/aQYP6rbLSP5CUCzW4kffN0TobaHX6f9LMZuWR
 iPW2iKqXHG35T+7kSlM+hQdbYWsxgDJv/cF15mtr4XN6xYpDMJbZtCpwEYqodCz5URRb
 Mj0yJTEkMC+cEwpr8DybUMogfvjVMz+T4nv2cvSvMAvBLFqLKtC+nzXiJ6Ru9M4XL3mq
 QhhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=Qmzj5sXb0dQGIp3IEqGvuU1Z+vJnbjFyzmJBniDVjRY=;
 b=hr//5NdScrLB5Pt9cd0Ad0YOFCyl6AhJt2yf5s+bOOCI8+IPbMZb/jcKWE3nX/W77G
 xxUyYiZBX7FVET+sLt2StZq+cshrs9huVwpI8CK4W56ppcEqMOu8FJsDnxpRMf9ToN7u
 aB4IHn3DdPlYNhvwj7hP8n8x2IO/C2Uz+UMKt4gwilrxGTmBwT5xdG6RDv1NzM335obR
 cqZky1zeE1fiFJiIf5B/kjd8kihWNjjRpvE/zutrGHPCAxsqhl26Cgt0iLGbItNvaYof
 YVr/5byZuckqbWwxfReSlfIJvFXkzR2R8mefA6cjOp3nwzbXVtdURESsyeL8c3WPxF/w
 QcoA==
X-Gm-Message-State: AOAM531d66a0vYtdCBcLGCOpG228X6YAuxm/wokCiqKh5FV6xk2gUlEE
 k4nsGRwETKZSZB3wj+p555VhIQ==
X-Google-Smtp-Source: ABdhPJxsaaoyh3v42GGp2jx2R71stELQyc5iAP9FqL9RmKf4o2XjMTUiclQ29lbfFLfXGQ+B5ufxWw==
X-Received: by 2002:a5d:4d92:: with SMTP id b18mr7614957wru.167.1621427041422; 
 Wed, 19 May 2021 05:24:01 -0700 (PDT)
Received: from dell ([91.110.221.215])
 by smtp.gmail.com with ESMTPSA id x11sm24810477wrl.13.2021.05.19.05.24.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 May 2021 05:24:01 -0700 (PDT)
Date: Wed, 19 May 2021 13:23:59 +0100
From: Lee Jones <lee.jones@linaro.org>
To: Zou Wei <zou_wei@huawei.com>
Message-ID: <20210519122359.GA2415519@dell>
References: <1620801226-18474-1-git-send-email-zou_wei@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1620801226-18474-1-git-send-email-zou_wei@huawei.com>
Cc: support.opensource@diasemi.com, linux-kernel@vger.kernel.org,
 alexandre.torgue@foss.st.com, mcoquelin.stm32@gmail.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH -next] mfd: da9052/stmpe: Add and modify
 MODULE_DEVICE_TABLE
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

T24gV2VkLCAxMiBNYXkgMjAyMSwgWm91IFdlaSB3cm90ZToKCj4gVGhpcyBwYXRjaCBhZGRzL21v
ZGlmaWVzIE1PRFVMRV9ERVZJQ0VfVEFCTEUgZGVmaW5pdGlvbiB3aGljaCBnZW5lcmF0ZXMKPiBj
b3JyZWN0IG1vZGFsaWFzIGZvciBhdXRvbWF0aWMgbG9hZGluZyBvZiB0aGlzIGRyaXZlciB3aGVu
IGl0IGlzIGJ1aWx0Cj4gYXMgYW4gZXh0ZXJuYWwgbW9kdWxlLgo+IAo+IFJlcG9ydGVkLWJ5OiBI
dWxrIFJvYm90IDxodWxrY2lAaHVhd2VpLmNvbT4KPiBTaWduZWQtb2ZmLWJ5OiBab3UgV2VpIDx6
b3Vfd2VpQGh1YXdlaS5jb20+Cj4gLS0tCj4gIGRyaXZlcnMvbWZkL2RhOTA1Mi1pMmMuYyB8IDEg
Kwo+ICBkcml2ZXJzL21mZC9zdG1wZS1pMmMuYyAgfCAyICstCj4gIDIgZmlsZXMgY2hhbmdlZCwg
MiBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCgpBcHBsaWVkLCB0aGFua3MuCgotLSAKTGVl
IEpvbmVzIFvmnY7nkLzmlq9dClNlbmlvciBUZWNobmljYWwgTGVhZCAtIERldmVsb3BlciBTZXJ2
aWNlcwpMaW5hcm8ub3JnIOKUgiBPcGVuIHNvdXJjZSBzb2Z0d2FyZSBmb3IgQXJtIFNvQ3MKRm9s
bG93IExpbmFybzogRmFjZWJvb2sgfCBUd2l0dGVyIHwgQmxvZwpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGlu
dXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxt
YW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
