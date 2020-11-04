Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D0AF72A62C1
	for <lists+linux-stm32@lfdr.de>; Wed,  4 Nov 2020 11:58:43 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 95839C36B36;
	Wed,  4 Nov 2020 10:58:43 +0000 (UTC)
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
 [209.85.221.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 842ABC36B25
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  4 Nov 2020 10:58:42 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id p1so2392733wrf.12
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 04 Nov 2020 02:58:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=K5kGjJgq41cgHa9mbHu2qDDUb9+DTH+gsEgTKKnHypw=;
 b=Qr+Q22nHH7dfWUg8Ym0TTd+J5aX5LwDo85DMggbJQ8boP9NBrHWI0wmNyeaTBGNkrA
 FH6a2QfkjaZZqOz6TqXAd0QRR6M9J5kHyxSmzlu60xzrVvL1XQcaIT9+9nXej9psdiNq
 lvBShMrmbRMBzOfZ40tFuRXOBLhQMj0QTSa+Mdsl+0XbeKQEwWX+07YAbiwmL9HPoaNG
 vzX4YNtxeROvfOr3DZOFm5uqQ9sfkXB/aGovNXDx36vkS7aguMv5HrBluhhn5Ph+K9cG
 Cax9A/0U4UaztgRpoRQf2WAtPVuw7THTWPYNTh1/fFZ128xPrH4kXGwisbD6OhV7cvW5
 aqUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=K5kGjJgq41cgHa9mbHu2qDDUb9+DTH+gsEgTKKnHypw=;
 b=HJ+TNzciYuF8WZQB7ewXyR+erXtpiXhcgwcztFz0s/6CVOywoWG+oPatv6SyOrkrQU
 J9Vvk0c59czailIcSRi20I2Q6yqM6nre4PbUoa/P74HfjzaEmvAWBt5+lJgZBcjaA31k
 2sUYJSncFc1nc/w+0d8qr5FKRKB5K+VDH7azAeRNdZlNeq8nLkvJ9H4uay/caQP4Eroz
 TLq5+CIGjNWwcrBOq18DPybEgKnoIRQpTM6mylhMjDltXaijbcCbbIkvkTlVUzLbNFjU
 y+0/keEjDBcguZGuylNTiJou3QfskTr7neJKxmqKvOzd0/sCGhPGxzvlEjojk+IYFG0l
 J8yA==
X-Gm-Message-State: AOAM530iyS8o2Z3Tq92XAdndfDCSqC+5/K293/rjcw60LFdA8fuINMvV
 yX5uz8BqM9+c1aVXDpg3Yvsa0Q==
X-Google-Smtp-Source: ABdhPJxZpBJzRmkpiFeoF7/rQKVJpSRhYGv0xh2AuwT70dKipd5ymSuSJKDDJ4P3E/Gumjnr9ucm/A==
X-Received: by 2002:adf:84a5:: with SMTP id 34mr31107584wrg.8.1604487522128;
 Wed, 04 Nov 2020 02:58:42 -0800 (PST)
Received: from dell ([91.110.221.242])
 by smtp.gmail.com with ESMTPSA id o3sm1877894wru.15.2020.11.04.02.58.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Nov 2020 02:58:41 -0800 (PST)
Date: Wed, 4 Nov 2020 10:58:39 +0000
From: Lee Jones <lee.jones@linaro.org>
To: Rikard Falkeborn <rikard.falkeborn@gmail.com>
Message-ID: <20201104105839.GX4488@dell>
References: <20200922192659.14535-1-rikard.falkeborn@gmail.com>
 <20200922192659.14535-7-rikard.falkeborn@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200922192659.14535-7-rikard.falkeborn@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>
Subject: Re: [Linux-stm32] [PATCH 6/8] mfd: stmpe: Constify static struct
	resource
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

T24gVHVlLCAyMiBTZXAgMjAyMCwgUmlrYXJkIEZhbGtlYm9ybiB3cm90ZToKCj4gQ29uc3RpZnkg
YSBjb3VwbGUgb2Ygc3RhdGljIHN0cnVjdCByZXNvdXJjZS4gVGhlIG9ubHkgdXNhZ2Ugb2YgdGhl
Cj4gc3RydWN0cyBpcyB0byBhc3NpZ24gdGhlaXIgYWRkcmVzcyB0byB0aGUgcmVzb3VyY2VzIGZp
ZWxkIGluIHRoZQo+IG1mZF9jZWxsIHN0cnVjdC4gVGhpcyBhbGxvd3MgdGhlIGNvbXBpbGVyIHRv
IHB1dCB0aGVtIGluIHJlYWQtb25seQo+IG1lbW9yeS4gRG9uZSB3aXRoIHRoZSBoZWxwIG9mIENv
Y2NpbmVsbGUuCj4gCj4gU2lnbmVkLW9mZi1ieTogUmlrYXJkIEZhbGtlYm9ybiA8cmlrYXJkLmZh
bGtlYm9ybkBnbWFpbC5jb20+Cj4gLS0tCj4gIGRyaXZlcnMvbWZkL3N0bXBlLmMgfCAxMCArKysr
Ky0tLS0tCj4gIDEgZmlsZSBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKyksIDUgZGVsZXRpb25zKC0p
CgpBcHBsaWVkLCB0aGFua3MuCgotLSAKTGVlIEpvbmVzIFvmnY7nkLzmlq9dClNlbmlvciBUZWNo
bmljYWwgTGVhZCAtIERldmVsb3BlciBTZXJ2aWNlcwpMaW5hcm8ub3JnIOKUgiBPcGVuIHNvdXJj
ZSBzb2Z0d2FyZSBmb3IgQXJtIFNvQ3MKRm9sbG93IExpbmFybzogRmFjZWJvb2sgfCBUd2l0dGVy
IHwgQmxvZwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpM
aW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJl
cGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0
aW5mby9saW51eC1zdG0zMgo=
