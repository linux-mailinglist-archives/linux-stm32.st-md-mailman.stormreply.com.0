Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cG51M9vkEWrirgYAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Sat, 23 May 2026 19:33:15 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D3DA5C00A1
	for <lists+linux-stm32@lfdr.de>; Sat, 23 May 2026 19:33:14 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8F524C87EDF;
	Sat, 23 May 2026 17:33:14 +0000 (UTC)
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com
 [209.85.215.180])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 01FA1C36B13
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 23 May 2026 17:33:14 +0000 (UTC)
Received: by mail-pg1-f180.google.com with SMTP id
 41be03b00d2f7-c8173b2af32so6582638a12.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 23 May 2026 10:33:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1779557592; x=1780162392;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=eCj8+oLwvPOIbmY+qV1+VohiIFMiRIVX9QeRtC1IOt0=;
 b=ETwhUeruUN+GKd44yWXSYuztTLaljgz6Mpolt/JRJo/oiB5inSghhPd0VHUIQsUwgO
 IHZGkH3FPkw4W1r2IPdgLzRLTtlkAFXzgrlLFR/sbr/wiFYCM18aQE21coTnnwIrfZG6
 D3X+kpGE3kw/FIdN0IzqP2zF1+U4PVJhuj6HAKYq8Xf8eNoq6KMlYE5jrECDnwrAOEov
 MNqFJLJoZDZx10PlOEVx3IwK1tRSQSU3W53Cbczm/I1p/aiOHCY2WsxFp2uZVdMN0z0Z
 tsM4c5QIiPXGnnwTIU1+iX7KaNWO54bZxuW5gQphFojJM5YJY16JJV1/b1+/l15xWzc0
 bIxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779557592; x=1780162392;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=eCj8+oLwvPOIbmY+qV1+VohiIFMiRIVX9QeRtC1IOt0=;
 b=do+Tz6UjOSdFT1P6tTJhVypgeNYDchewX2/kXIHjgHNlieA1uhfHsiTwfBmm32mxP0
 tEJCORawW7BsYakH0ObHRfrmCxDFTSNRQeL2MwPHoGYZ5uFXv3ordTA/3DF+nnS/1zSV
 GEyAO6TsAknM975jVJCyVnzAaWS2jI5jF/D+65Fa6JsDLZedHXrTNZFK04YihKvr8dYF
 Ph9om7MwTZ+XMS/sMjUicV/xEI4wg0arzrdvkUObJiF52jjNcO+8rMqpT7jCD4L4V8WK
 l1kav6vkVP/57H2vBGrMcmHSeaUr+fCiE8PE08KKIe/mdYSrk3Mmc/ndO4GUZBgri2tP
 RpNg==
X-Forwarded-Encrypted: i=1;
 AFNElJ8ICI3AS6k6DDJTRP+9tbGHVkwH0Hdshim2ZEAT6Hsuw/k14IZpqWK8sDy2DClFmWTpY3vTzlGoHVDIOw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YzSvFlmxTbwhA59yyStxBl4L4iiX2wy+JNmSFl6gEY5reJP8YVh
 loPv4UEID3ClyySZm2gqe+rggd1gg3IggZCMxShr0KxAcoRYGJ6gNWpF
X-Gm-Gg: Acq92OEa12rmRkIkxBFkKApAkEm6OK/IRU4Pc6JDgFhU2zBUZLUy/eXPWiYMx85+OyL
 Y+9WVWTTZtmj0FbXssdY427Xz1KJq0Zb1AHm+cbY9dptfxgZPRWmn+2WKyJh8NoKx6lj0nbKs/V
 gSV4BebvdQSmbv0mzWBcnyRlTAMDpabNPQQ3RLh6n0CH15Kes9YAQA9xThJrjLcrfi9bnXW9YTy
 nkNoBOTmf8dskwEQMEDTLQgNc8pit0YVCis0PGY/KIIYN8hpUze8xREtL6n6GYDIbMXL8SItKHU
 vWbvDM+tJDeqddQCh78vXEW1gIYaonsdaC/cf+B/jzkGp8aHF3UHJLVVNSCyLchBDY/3C2fHzKr
 Ripf7MGhdzX2xUbmzineuqs1Msl3A+wMA6mT9KSCaPTKZyRduqHikTJqNTdRHg6/xcqn1CBYu4L
 q6yP+JGokXhQrtDloHzw7jn4T6Yj1xFmExuoMbYHtNAbrUz+riTVK4833l8VrtrVUY8w==
X-Received: by 2002:a05:6a21:594:b0:3a7:1d55:b634 with SMTP id
 adf61e73a8af0-3b328f562bemr8292242637.38.1779557592547; 
 Sat, 23 May 2026 10:33:12 -0700 (PDT)
Received: from Ubuntu.. ([49.37.171.12]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-84164fc646bsm5162945b3a.46.2026.05.23.10.33.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 23 May 2026 10:33:11 -0700 (PDT)
From: Manish Baing <manishbaing2789@gmail.com>
To: lee@kernel.org, ukleinek@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, mcoquelin.stm32@gmail.com,
 alexandre.torgue@foss.st.com, linusw@kernel.org
Date: Sat, 23 May 2026 17:32:50 +0000
Message-ID: <20260523173251.72540-2-manishbaing2789@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260523173251.72540-1-manishbaing2789@gmail.com>
References: <20260523173251.72540-1-manishbaing2789@gmail.com>
MIME-Version: 1.0
Cc: linux-pwm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>,
 manishbaing2789@gmail.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v4 1/2] dt-bindings: mfd: st,
	stmpe: Add missing properties for PWM subnode
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
X-Spamd-Result: default: False [4.49 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	R_DKIM_REJECT(1.00)[gmail.com:s=20251104];
	MID_CONTAINS_FROM(1.00)[];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89:c];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed),none];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_RECIPIENTS(0.00)[m:lee@kernel.org,m:ukleinek@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:mcoquelin.stm32@gmail.com,m:alexandre.torgue@foss.st.com,m:linusw@kernel.org,m:linux-pwm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:conor.dooley@microchip.com,m:manishbaing2789@gmail.com,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,m:krzk@kernel.org,m:conor@kernel.org,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,foss.st.com];
	FREEMAIL_CC(0.00)[vger.kernel.org,microchip.com,gmail.com,st-md-mailman.stormreply.com,lists.infradead.org];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[manishbaing2789@gmail.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	GREYLIST(0.00)[pass,meta];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[manishbaing2789@gmail.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,dt];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	DKIM_TRACE(0.00)[gmail.com:-];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_SPAM(0.00)[0.681];
	DBL_BLOCKED_OPENRESOLVER(0.00)[st-md-mailman.stormreply.com:rdns]
X-Rspamd-Queue-Id: 6D3DA5C00A1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

VGhlIHN0LHN0bXBlLXB3bSBiaW5kaW5nIGlzIGFscmVhZHkgY292ZXJlZCBieSB0aGUgTUZEIHNj
aGVtYSBpbgpEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbWZkL3N0LHN0bXBlLnlh
bWwuIEhvd2V2ZXIsIHRoZQpQV00gc3Vibm9kZSB3YXMgbWlzc2luZyBhICdyZXF1aXJlZCcgcHJv
cGVydGllcyBibG9jay4gVGhpcyBhbGxvd2VkCkRldmljZSBUcmVlIG5vZGVzIHRvIHBhc3MgdmFs
aWRhdGlvbiBldmVuIGlmIHRoZSAnY29tcGF0aWJsZScKc3RyaW5nIHdhcyBvbWl0dGVkLiBUaGlz
IG9taXNzaW9uIGNvdWxkIGxlYWQgdG8gcHJvYmUgZmFpbHVyZXMKYXQgcnVudGltZS4KCkZpeCB0
aGUgc2NoZW1hIGJ5IGFkZGluZyB0aGUgbWlzc2luZyAncmVxdWlyZWQnIGJsb2NrLgoKU2lnbmVk
LW9mZi1ieTogTWFuaXNoIEJhaW5nIDxtYW5pc2hiYWluZzI3ODlAZ21haWwuY29tPgpBY2tlZC1i
eTogQ29ub3IgRG9vbGV5IDxjb25vci5kb29sZXlAbWljcm9jaGlwLmNvbT4KQWNrZWQtYnk6IFV3
ZSBLbGVpbmUtS8O2bmlnIDx1a2xlaW5la0BrZXJuZWwub3JnPgotLS0KIERvY3VtZW50YXRpb24v
ZGV2aWNldHJlZS9iaW5kaW5ncy9tZmQvc3Qsc3RtcGUueWFtbCB8IDQgKysrKwogMSBmaWxlIGNo
YW5nZWQsIDQgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNl
dHJlZS9iaW5kaW5ncy9tZmQvc3Qsc3RtcGUueWFtbCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJl
ZS9iaW5kaW5ncy9tZmQvc3Qsc3RtcGUueWFtbAppbmRleCBkZjQzODc4ZmJlMTguLjRiYjA1ZDU0
NDkwMSAxMDA2NDQKLS0tIGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL21mZC9z
dCxzdG1wZS55YW1sCisrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tZmQv
c3Qsc3RtcGUueWFtbApAQCAtMTI3LDYgKzEyNywxMCBAQCBwcm9wZXJ0aWVzOgogICAgICAgIiNw
d20tY2VsbHMiOgogICAgICAgICBjb25zdDogMgogCisgICAgcmVxdWlyZWQ6CisgICAgICAtIGNv
bXBhdGlibGUKKyAgICAgIC0gIiNwd20tY2VsbHMiCisKICAgdG91Y2hzY3JlZW46CiAgICAgdHlw
ZTogb2JqZWN0CiAgICAgJHJlZjogL3NjaGVtYXMvaW5wdXQvdG91Y2hzY3JlZW4vdG91Y2hzY3Jl
ZW4ueWFtbCMKLS0gCjIuNDMuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1h
aWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29t
L21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
