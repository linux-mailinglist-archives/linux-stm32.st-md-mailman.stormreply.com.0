Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 33D70B53306
	for <lists+linux-stm32@lfdr.de>; Thu, 11 Sep 2025 15:02:18 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9589DC349C1;
	Thu, 11 Sep 2025 13:02:17 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com
 [209.85.128.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 357CAC36B14
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 11 Sep 2025 13:02:17 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id
 5b1f17b1804b1-45dda7d87faso4742075e9.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 11 Sep 2025 06:02:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1757595736; x=1758200536;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:in-reply-to:from:content-language:subject
 :references:cc:to:user-agent:mime-version:date:message-id:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4MqrGMT4gYHEDE95276JluVewZB8Y2DkUm+5Ln4jUr8=;
 b=Nsp3LWCWCQMbNMmPrR3oSUl+VZGj0v+hlb14E9mYTWzMMRhVXUhS2im1CF/iaUgc49
 b2oilyLtDly2vj3rmjHU12ZVWA8HumfwAe2QtOX871I5zkYMZV412Qf/3uOoyZBg+H5k
 0SWAKRqhp91n2wlkwqIiefBvYzg9CwiHXSRNi9rotSAR3c54yueG5EzboG6SaIvFgPo+
 WvZIT4Xsyu05DCRX4YqS6kKkcDuQBYHJdwbhzvjKyrndM9XxP1Th7DPV7WNKLCchrnq4
 51REZ5rnxX2kT/B7SqKmd9XO9fSp98evwz2hmqdiLiCu1FhpOE5MEZMXYQqQ0S0xVmsa
 +Spw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757595736; x=1758200536;
 h=content-transfer-encoding:in-reply-to:from:content-language:subject
 :references:cc:to:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=4MqrGMT4gYHEDE95276JluVewZB8Y2DkUm+5Ln4jUr8=;
 b=uALTqsF7KC5yohBNX/GfAgG6qgbwuXFOuUcglDY7UAS7cFLfHZXClxmns2yklf2Ppp
 zI0UrXBfiHYyIpAyBCwFqHl5EHNh9jq0/jk5HNkP+2WWRoPski97UP/yp2SkzgvYhLlM
 bOBOlVUWb/SoECwwwDJlLZVDF9TqPqgdgpwJzioxB88dtw8nMBFWEnTlq7uTV5xFVhbn
 ndYUrsUqIwgE/QRZcj/ZhOB++WsogBvLegT/JdIigMxQPp27BqcIVBT9dZD7JDuK4KLM
 OtTmTccVmJi5om5JHuGx/+BCupbOrDh0SXV5X834fJ/auEBrbdJnNDukQPwmfDfd1ueP
 Q3Gg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWqhu5sniLSm5KOnwnA2FxeSjrGhgIaq52Ehy94EvmyZDwiqtH6ZcqGFInyzTJm81Cbdf2PNsAeK79NwA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YzBREfFlKzcJeywtHini35wsKjhS8yQpPlR2E3bHCoQz/I7eeTy
 VHaRmmNyNdy4zJSKbudXTCLPcQYpGEmtbGvHFILotOVqvrLgGmTgChor
X-Gm-Gg: ASbGnctA+kw/LeZWXdlh4AKldP4K3U1QH9MnMnvUeq38+eFrYvRPwkNG2Zu1k2mtuX6
 hab8GzwaobIMMjYCmHq0x61jt/6t8U7Z2KNE3HVhGbiiRSqZow0853yAs31E4eLBzmYBPbtMux9
 E9k8GZLBmuPQCx9V4cVZ2Fdtmju6km0uuRSPALCLxgDqTdyPlIkFN31qMKNrwl+/T9NPICp7M4p
 zP/U2D2RQkrKydjL/K8LjdlsI/2qQyLSOzA5a7nqot1+geXc7bmxC7O2EjKcGNOLRXEiDp15sdx
 YW9fDfmE5Tg5QbAQLtS0j8pqojN2M7ho6REYd7BR+3Ao+DHxH6Vpag3v8QZN+kpc/m3sP7zz4OK
 Dq3TIHrMZC2qi4tkw2sLSqujowU05VbGU63bDVOSwwo5VP0qn59WnpKkTTehw7uZ+bN2uBzjsnH
 +9Ue9QF2/I0DR6qJceEm68KBskNgRxJBflLqMdQPIQBosWh7oeLyjmimgeqS7pAMxUMQ==
X-Google-Smtp-Source: AGHT+IGBOvVZEanDymsSCzD5uKwzNIrpA1+ow8iNte/zspzRRuQdTlNd8GKRKv8tv4hBSd91nRRPVw==
X-Received: by 2002:a05:600c:1387:b0:45d:d2cd:de36 with SMTP id
 5b1f17b1804b1-45dddeb8e9emr178967705e9.12.1757595735989; 
 Thu, 11 Sep 2025 06:02:15 -0700 (PDT)
Received: from ?IPV6:2a02:8440:7130:c664:5cf3:46ff:1e0c:dcb9?
 (2a02-8440-7130-c664-5cf3-46ff-1e0c-dcb9.rev.sfr.net.
 [2a02:8440:7130:c664:5cf3:46ff:1e0c:dcb9])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3e7607d7affsm2554580f8f.48.2025.09.11.06.02.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Sep 2025 06:02:13 -0700 (PDT)
Message-ID: <1455564d-1cc0-4feb-80ac-f0a619fe73df@gmail.com>
Date: Thu, 11 Sep 2025 15:02:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: clement.legoffic@foss.st.com
References: <20250715-upstream-optee-rtc-v1-0-e0fdf8aae545@foss.st.com>
Content-Language: en-US
From: =?UTF-8?Q?Cl=C3=A9ment_Le_Goffic?= <legoffic.clement@gmail.com>
In-Reply-To: <20250715-upstream-optee-rtc-v1-0-e0fdf8aae545@foss.st.com>
Cc: linux-rtc@vger.kernel.org, alexandre.belloni@bootlin.com,
 linux-kernel@vger.kernel.org, jens.wiklander@linaro.org,
 clement.leger@bootlin.com, linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH 0/3] Add alarm operation to the rtc-optee
	driver
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

SGVsbG8sCgpBbnlvbmUgdG8gcmV2aWV3IHRoaXMgc2VyaWVzID8KSSB1c2VkIHRoZSBtYWlsdG86
bGluayBmcm9tIHRoZSBsb3JlLmtlcm5lbCB3ZWJzaXRlIGhlcmU6Cmh0dHBzOi8vbG9yZS5rZXJu
ZWwub3JnL2FsbC8yMDI1MDcxNS11cHN0cmVhbS1vcHRlZS1ydGMtdjEtMC1lMGZkZjhhYWU1NDVA
Zm9zcy5zdC5jb20vIAoKTGV0IG1lIGtub3cgaWYgdGhlIHNlcmllcyBuZWVkcyBhIHJlc2VuZC4K
CkJlc3QgcmVnYXJkcywKQ2zDqW1lbnQKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1k
LW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHku
Y29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
