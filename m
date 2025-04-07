Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EFD82A7D920
	for <lists+linux-stm32@lfdr.de>; Mon,  7 Apr 2025 11:13:52 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A5ECEC78F97;
	Mon,  7 Apr 2025 09:13:52 +0000 (UTC)
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com
 [209.85.208.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 62175C6DD6D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  7 Apr 2025 09:13:51 +0000 (UTC)
Received: by mail-ed1-f41.google.com with SMTP id
 4fb4d7f45d1cf-5e5cded3e2eso6531421a12.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 07 Apr 2025 02:13:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1744017231; x=1744622031;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=P1Uk4aOu80S83390MO9VGJ4kqxev3EQy2D7fW7X8p3w=;
 b=codxhxtqFjwOdo5u2rD0UjSlgXNXrxJtyjCIT3axrjehIinXltqw7d6VFWYE9+SIAx
 B1W4WCWRGCk3455HOMvzJu5I4H01EfP96YDIn7beqoKk11bCb+loDDL5Ek2zKf5AnBBd
 8/tfSW6wyVmjpkyPZQoJqFzNpZ2dP8XKUJpG6iiT3yHf+KV+CyBqUH2yLEAHq4PL1jMT
 EC2MwHzTraZCdw8zUktKEcmM/u7u7IPA7pmOH0+xibYi3skkXDuGp8eWD/XhPJRBM32x
 iq824AG4tTTHGKnasdEwpmwwVpgeUaVTsVeixJZaOqhayeen28R2RXbhIB2sH0IlHF32
 d3+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744017231; x=1744622031;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=P1Uk4aOu80S83390MO9VGJ4kqxev3EQy2D7fW7X8p3w=;
 b=QRoeesJngldjRc7CIp+BSofh7XoFxg6xwwEJuORFFruKJSHVtNMgprEYBpDHp53V38
 yKDsMkAN0BM3Oz/WcOl40e5RvyJ+KdUOV+kqIOLBcNyXBt3CWKyPb/2in9VVsmJNshWI
 aDbczJGlq7QpJXkUYZVxvRUDNmUMxCN2kxltRTxTEGdGx5R6QhvXmlTZP9TSILR8dRV9
 EU5AMnInRzAUwikGQ7o51tuD/CTX6t3ba+/YiQPnwpUyveeXk5vkeNIwd4uWkHEeeWZU
 fkFrR0T9amdSwofwn3YfZZ6DHcqwPa5wRNniAkFlh27SMy3biWot9tV0hLlcm3ygNjet
 1VSQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVc+DYgy+B65Ao1TzvHdx47zTca1dwo+IUPFSes4tRJqZbJTFXe7CoaFb16Slol09hURuyUKF6qnkt9Gw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YzlgNQNmiTLgRsvnxJLU5hLIDyHccgKFRowQdaVJUJ4OYW0ZRZN
 UwJGEmK9TVnPQmCIfVvoA6pRXieHLz88sQ6STpB8qgugJ6RnOg+s
X-Gm-Gg: ASbGncuL4m4lBoqUs+BqBa8IFYIG/C5xKQQ+EvjJ5/62xDfVAjqQ+JKZXwfnKiNGg3c
 RJKW3CRYvG4P7hRLjV4XMdXEmsFYrm1Y8zbGsj3hBF4pjjKXMpfDwDNzfQJJOHXqK9yfa/dfahW
 5dQVrNWYLTyXPVbyNmqzKX8jJar+KWrzDXmZod+LLBLObpbI7TZZxjJxACPYsGPLFDO6q5slHKm
 z/Hzu69Jnn818tWJiEJE1Dbn9wMIJabNh2D+SB/Xl7liQ1gRDpB4+ZoDpkFsqbGCl5z+eOSnOfi
 PwMpPa1HKMmn0J/4mHInnyDmaNBy8lKoBQlvHoGYMut3swFasMpekw==
X-Google-Smtp-Source: AGHT+IFT3ocNy0hfSa6LZN537JBXUdT2MD+recEeiEmTsR3iPDKF8z5UKZctlOPeKBh/G3Xz3E5JQA==
X-Received: by 2002:a05:6402:501f:b0:5eb:9673:183f with SMTP id
 4fb4d7f45d1cf-5f0db8352a7mr7676899a12.20.1744017230310; 
 Mon, 07 Apr 2025 02:13:50 -0700 (PDT)
Received: from [192.168.1.130] ([188.193.103.108])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5f08771a1c6sm6490830a12.11.2025.04.07.02.13.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Apr 2025 02:13:50 -0700 (PDT)
Message-ID: <020081ff-9393-42b2-b0e1-67eed9220aa1@gmail.com>
Date: Mon, 7 Apr 2025 11:13:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
References: <20250326094429.2397365-1-goran.radni@gmail.com>
 <20250326094429.2397365-3-goran.radni@gmail.com>
Content-Language: en-US
From: Goran Radenovic <goran.radni@gmail.com>
In-Reply-To: <20250326094429.2397365-3-goran.radni@gmail.com>
Cc: devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH v4 2/3] dt-bindings: arm: stm32: Document
 Ultratronik's Fly board DT binding
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

SGksCgp0aGFuayBZb3UgdmVyeSBtdWNoIGZvciB0aGUgZmVlZGJhY2sgc28gZmFyLiBEbyBZb3Ug
aGF2ZSBhbnkgdXBkYXRlIGZvciBtZT8KCkJlc3QgcmVnYXJkcwpHb3JhbgoKT24gMjYuMDMuMjUg
MTA6NDQsIEdvcmFuIFJhxJFlbm92acSHIHdyb3RlOgo+IFRoaXMgY29tbWl0IGRvY3VtZW50cyB1
bHRyYS1mbHktc2JjIGRldmljZXRyZWUgYmluZGluZyBiYXNlZCBvbgo+IFNUTTMyTVAxNTcgU29D
Lgo+Cj4gQWNrZWQtYnk6IFJvYiBIZXJyaW5nIChBcm0pIDxyb2JoQGtlcm5lbC5vcmc+Cj4gU2ln
bmVkLW9mZi1ieTogR29yYW4gUmHEkWVub3ZpxIcgPGdvcmFuLnJhZG5pQGdtYWlsLmNvbT4KPiAt
LS0KPiAgIERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9hcm0vc3RtMzIvc3RtMzIu
eWFtbCB8IDUgKysrKysKPiAgIDEgZmlsZSBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKykKPgo+IGRp
ZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvYXJtL3N0bTMyL3N0
bTMyLnlhbWwgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvYXJtL3N0bTMyL3N0
bTMyLnlhbWwKPiBpbmRleCBiNmM1NmQ0Y2U2YjkuLmMxY2I1NGZmYjIxMCAxMDA2NDQKPiAtLS0g
YS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvYXJtL3N0bTMyL3N0bTMyLnlhbWwK
PiArKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvYXJtL3N0bTMyL3N0bTMy
LnlhbWwKPiBAQCAtMTc1LDYgKzE3NSwxMSBAQCBwcm9wZXJ0aWVzOgo+ICAgICAgICAgICAgIC0g
Y29uc3Q6IHBoeXRlYyxwaHljb3JlLXN0bTMybXAxNTdjLXNvbQo+ICAgICAgICAgICAgIC0gY29u
c3Q6IHN0LHN0bTMybXAxNTcKPiAgIAo+ICsgICAgICAtIGRlc2NyaXB0aW9uOiBVbHRyYXRyb25p
ayBTVE0zMk1QMSBTQkMgYmFzZWQgQm9hcmRzCj4gKyAgICAgICAgaXRlbXM6Cj4gKyAgICAgICAg
ICAtIGNvbnN0OiB1bHRyYXRyb25payxzdG0zMm1wMTU3Yy11bHRyYS1mbHktc2JjCj4gKyAgICAg
ICAgICAtIGNvbnN0OiBzdCxzdG0zMm1wMTU3Cj4gKwo+ICAgICAgICAgLSBkZXNjcmlwdGlvbjog
U1QgU1RNMzJNUDI1NyBiYXNlZCBCb2FyZHMKPiAgICAgICAgICAgaXRlbXM6Cj4gICAgICAgICAg
ICAgLSBlbnVtOgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9y
bXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9s
aXN0aW5mby9saW51eC1zdG0zMgo=
