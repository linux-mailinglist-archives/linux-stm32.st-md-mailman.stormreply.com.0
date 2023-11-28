Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DB6547FBFE5
	for <lists+linux-stm32@lfdr.de>; Tue, 28 Nov 2023 18:01:58 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8BA3EC6B46B;
	Tue, 28 Nov 2023 17:01:58 +0000 (UTC)
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com
 [209.85.208.182])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 176EDC6B469
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 28 Nov 2023 17:01:57 +0000 (UTC)
Received: by mail-lj1-f182.google.com with SMTP id
 38308e7fff4ca-2c9b8aa4fc7so7149441fa.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 28 Nov 2023 09:01:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1701190917; x=1701795717;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RGsTE+h92DnXeyvQhi72RUIHAES9rx7gcu8lPhY952A=;
 b=mQCQmrdlXrAtEk4+/dtMuY2I4hGocbrTyyFjI69bh59Nz4XfP77Q9+LUu02qbMkmCZ
 bxy+9UJmmm3Q88kItGB4s12MoPtleP1lc+Pc3Mr85G9lzDiGk5jE3/v4T2Oc0LEtHV3x
 DPfmJgnBayAYIQeyDA/u9AiVlnjUczZVWTnBrmboJrwVxA0raoOD4QsplNSQeSPrTzJj
 H9+EmKWpVAzqrJy4bH0kZ6Ht38w0q0D+MEVFbTCyJTE5u1aMYn1OmkacwLBiQUpZ2XR/
 5sfpgaiguTO/KuoOcx/YcruxopHWQIb1c5rDTnIOtayxomEJs27rpxXlgOxllBfaOhVi
 nu/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701190917; x=1701795717;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=RGsTE+h92DnXeyvQhi72RUIHAES9rx7gcu8lPhY952A=;
 b=oWXkyDpKqQQWfg9deZ4LNHnWuLQe9NDQC/JVRuyOyULVcWl43rNZxwL4kMApNoGB1q
 afEGvQR51hDtGUmu3Z4nkmJ8/rXb/0gxMds71I5TZP+J0iur5oyhXr27kZoaEY/Cjmbw
 VxOtH6SLwB2ONFtlTarZ7nEOzsdyiP/3kBUxeq3Ctvh5Tdy6FzQgpnhgqRsq/ii6RxbI
 HoH6+81t1swY4SDia68GnHbHYEY9chlIhsFdagjEGC2xReqEAYtW975qavIhzVjEjLeB
 pcbYhp/KNJuOH7aTn+oJi3SpolPmcP2gdh7ngLLktPoCtfYenQV0t28Jk/FLlZy9POnM
 6IJQ==
X-Gm-Message-State: AOJu0YyF9d69K7u7AvvnSWHCRNHEvOuh2UT+OchifdhcpjWOS/+qjywA
 4UT/6e79ydOemJFQnUfYRQY=
X-Google-Smtp-Source: AGHT+IFAuEe6MZgvA+lTavbcl8TE8o7Pzs/YhJ/lRM8NRtuzYKZoNxgz0oR4YOKKydd71HKVsz64Jg==
X-Received: by 2002:a2e:a58d:0:b0:2c9:99ca:1317 with SMTP id
 m13-20020a2ea58d000000b002c999ca1317mr6615762ljp.24.1701190917070; 
 Tue, 28 Nov 2023 09:01:57 -0800 (PST)
Received: from localhost
 (p200300e41f0fa600f22f74fffe1f3a53.dip0.t-ipconnect.de.
 [2003:e4:1f0f:a600:f22f:74ff:fe1f:3a53])
 by smtp.gmail.com with ESMTPSA id
 fa8-20020a05600c518800b0040b478da760sm6785928wmb.48.2023.11.28.09.01.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Nov 2023 09:01:56 -0800 (PST)
From: Thierry Reding <thierry.reding@gmail.com>
To: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Date: Tue, 28 Nov 2023 18:00:00 +0100
Message-ID: <170119076367.215216.2570140207863942749.b4-ty@gmail.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231023174616.2282067-13-u.kleine-koenig@pengutronix.de>
References: <20231023174616.2282067-13-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Cc: linux-pwm@vger.kernel.org,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 linux-samsung-soc@vger.kernel.org, Alim Akhtar <alim.akhtar@samsung.com>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Fabio Estevam <festevam@gmail.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
 NXP Linux Team <linux-imx@nxp.com>, kernel@pengutronix.de,
 Shawn Guo <shawnguo@kernel.org>, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v3 00/11] pwm: Use
	DEFINE_SIMPLE_DEV_PM_OPS for PM functions
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

Ck9uIE1vbiwgMjMgT2N0IDIwMjMgMTk6NDY6MTcgKzAyMDAsIFV3ZSBLbGVpbmUtS8O2bmlnIHdy
b3RlOgo+IHRoaXMgdjMgd2FzIG5lY2Vzc2FyeSBiZWNhdXNlIHNvbWUgbGluZXMgaW4gdGhlIGNv
bW1pdCBsb2cgb2YgYSBzdWJzZXQKPiBvZiB0aGVzZSBwYXRjaGVzIHdlcmUgZWF0ZW4uIEkgdGhp
bmsgdGhhdCBoYXBwZW5kIGR1cmluZyByZWJhc2UgLWkgd2hlcmUKPiBnaXQgZHJvcHMgbGluZXMg
c3RhcnRpbmcgd2l0aCAjIGR1cmluZyBnaXQtY29tbWl0LiBnaXQtYW0gaXNuJ3QgYWZmZWN0ZWQg
YnkKPiB0aGlzICJmZWF0dXJlIiwgc28gYXBwbGljYXRpb24gc2hvdWxkIHdvcmsgZmluZS4gU3Rp
bGwgY2hlY2tpbmcgdGhlc2UKPiBsaW5lcyBtYWtlIGl0IGludG8gdGhlIGdpdCBjb21taXQgaXMg
YSBnb29kIGlkZWEgSSB0aGluay4KPiAKPiBPdGhlciB0aGFuIHRoZSBmZXcgYWRkaXRpb25hbCBs
aW5lcyBpbiB0aGUgY29tbWl0IGxvZ3MsIG9uZSBSZXZpZXdlZC1ieToKPiBpcyBhZGRlZCBhbmQg
dGhlIHNlcmllcyBpcyBvdGhlcndpc2UgdW5jaGFuZ2VkLgo+IAo+IFsuLi5dCgpBcHBsaWVkLCB0
aGFua3MhCgpbMDEvMTFdIHB3bTogYXRtZWwtaGxjZGM6IFVzZSBERUZJTkVfU0lNUExFX0RFVl9Q
TV9PUFMgZm9yIFBNIGZ1bmN0aW9ucwogICAgICAgIGNvbW1pdDogNjhiYjI3ODE4ODg5YjA4NWQz
ZDcwMGJlNjljNDgzYzBlYTk4ZjQzMwpbMDIvMTFdIHB3bTogYXRtZWwtdGNiOiBVc2UgREVGSU5F
X1NJTVBMRV9ERVZfUE1fT1BTIGZvciBQTSBmdW5jdGlvbnMKICAgICAgICBjb21taXQ6IDQ0MGU0
NjM4OWRkYTBhYWZkZmFkZTdmYWJmYTUwMzhmOTU0NGFkYTIKWzAzLzExXSBwd206IGJlcmxpbjog
VXNlIERFRklORV9TSU1QTEVfREVWX1BNX09QUyBmb3IgUE0gZnVuY3Rpb25zCiAgICAgICAgY29t
bWl0OiBjNDYyZDNmOGZkMmZjODBhYTc0MzBmYTdhNDk4Y2JjOTJmNjVjM2I1ClswNC8xMV0gcHdt
OiBicmNtc3RiOiBVc2UgREVGSU5FX1NJTVBMRV9ERVZfUE1fT1BTIGZvciBQTSBmdW5jdGlvbnMK
ICAgICAgICBjb21taXQ6IDk2ZjY4ZjZmNDkzMmQ2YWRlNjg3OGYxM2MxZjY0NGY2YjQ2OWNmNmMK
WzA1LzExXSBwd206IGR3YzogVXNlIERFRklORV9TSU1QTEVfREVWX1BNX09QUyBmb3IgUE0gZnVu
Y3Rpb25zCiAgICAgICAgY29tbWl0OiA5MTA5YTRhMjM1MDliMTY2NGU2NDc5YWFhN2ZkNWU5ODNm
ODM4N2UxClswNi8xMV0gcHdtOiBpbXgtdHBtOiBVc2UgREVGSU5FX1NJTVBMRV9ERVZfUE1fT1BT
IGZvciBQTSBmdW5jdGlvbnMKICAgICAgICBjb21taXQ6IGE1YjczMjA0ZmQyZTZhNzhhMjljYzRi
YWVhMDcxZWY3MTU3MzFkZGMKWzA3LzExXSBwd206IHNhbXN1bmc6IFVzZSBERUZJTkVfU0lNUExF
X0RFVl9QTV9PUFMgZm9yIFBNIGZ1bmN0aW9ucwogICAgICAgIGNvbW1pdDogMWIxMmZhMzg5NGVh
ODlmZWZlMDU3ZjEyOGE1ZmRkYzcxZTNlNjkzYwpbMDgvMTFdIHB3bTogc3RtMzItbHA6IFVzZSBE
RUZJTkVfU0lNUExFX0RFVl9QTV9PUFMgZm9yIFBNIGZ1bmN0aW9ucwogICAgICAgIGNvbW1pdDog
YTY5MjkxMWZjYTUzZTQxZmRmNWM4YmM1ZDY2ZjAwZTk2NTExNzYyYgpbMDkvMTFdIHB3bTogc3Rt
MzI6IFVzZSBERUZJTkVfU0lNUExFX0RFVl9QTV9PUFMgZm9yIFBNIGZ1bmN0aW9ucwogICAgICAg
IGNvbW1pdDogN2M4ODUwMTdlYTViMGU4MDA4YjE4ZWUxNzVmMmM0ZDA2NjRhNGNhMQpbMTAvMTFd
IHB3bTogdGllY2FwOiBVc2UgREVGSU5FX1NJTVBMRV9ERVZfUE1fT1BTIGZvciBQTSBmdW5jdGlv
bnMKICAgICAgICBjb21taXQ6IDNlY2FiMTU0OWZlNDRiMjVmNThmYjMyZWVhZWExNTIwNjI1MTM4
OTQKWzExLzExXSBwd206IHRpZWhycHdtOiBVc2UgREVGSU5FX1NJTVBMRV9ERVZfUE1fT1BTIGZv
ciBQTSBmdW5jdGlvbnMKICAgICAgICBjb21taXQ6IGIzNzIxNTdmMjNlYThhYTk5YTI0MGM0N2E3
YmExMjY4NjU2NTU0ZDUKCkJlc3QgcmVnYXJkcywKLS0gClRoaWVycnkgUmVkaW5nIDx0aGllcnJ5
LnJlZGluZ0BnbWFpbC5jb20+Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWls
bWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
