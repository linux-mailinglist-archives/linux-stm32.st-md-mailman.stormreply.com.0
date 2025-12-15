Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CBEC5CBE3D6
	for <lists+linux-stm32@lfdr.de>; Mon, 15 Dec 2025 15:17:36 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6A7FCC35E2B;
	Mon, 15 Dec 2025 14:17:36 +0000 (UTC)
Received: from mail-ed1-f66.google.com (mail-ed1-f66.google.com
 [209.85.208.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C5141C36B2A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 15 Dec 2025 14:17:35 +0000 (UTC)
Received: by mail-ed1-f66.google.com with SMTP id
 4fb4d7f45d1cf-640e9f5951aso5334514a12.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 15 Dec 2025 06:17:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1765808255; x=1766413055;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ppOcPFqIwq9P7NGqZqTz1/tjn18c3F+fMKSBb9x2/Cg=;
 b=VtZMpUnLleL4/8CFRbonyIY+kr83kjqswpKVNL+OmS9WuGZWtdeMCMqWDrt1BeBrm7
 a/ssCXLO+ifKw5QkorBZH24R8GxkM6JOwRVRC6iZz08CPsp6sN9+0Lq8w9e3gG2c0rsN
 IsDiPrKCLQ105F1KO/Z0hGNkMenZgTIaM9ALzgiOP10JuBKTLjvOUS0fAtHvlxTQqalw
 KbVcLt5gIkazK9cL6502ssmmX0A3wH/27OJSDVPE4ffRPrpF8aepdBdRPP9rCjKM8aOx
 yUeXLXiDsPnRJyLNeHtmGWNKKGIAOoSCQ8NVlrEO9a0DUGRGDKW+Qc04DzI4mYD4xLZg
 E+wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765808255; x=1766413055;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ppOcPFqIwq9P7NGqZqTz1/tjn18c3F+fMKSBb9x2/Cg=;
 b=kMYe4qKmnJdVEz2X8usBd8e4TgaRvTs1mvbqp/RsnhgntRZSdF9j3g0MLfxOHO3CKc
 8u8tzz/GnAL5Ol6/9ZrHB0ZM6enVlNa4vfLtbO3v/5ZP1n6OUlCHvzuineugznn5OYfW
 fEkg3xLweyLV81W44Tr9p2SvHRXXFgbFM1LzWmuPnFdLCcsR9de0TD/dK/rLf8yn2xRy
 0yYAIJaERER3d99URSf78ArKYPMZ6GaTJizhK0YeK2Y41/CKuV0KhkSXb7r33So6QTjc
 LuOWJ7+sJRijpEg6twTX8DT5MbuVdCWaAVOZTMqu4gkjC5PK+Q+tQzWweDVWF0kspp72
 ++TQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUvhkoa9bUmVAEW4+sIHkeUb8VaWGo9VhXOuktIhxZDyrRXuEe9SD4jg1p2g1kislSRZQ+RML2TOkAVEw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YwnWq03QlxkGpS1VdU9CFeZHWXf5PsB7XSy1j6Usz3NEWZjK8jf
 d8/waXleLAZ6hyPkNjrdRCu4eF3Q3arS+38c7Dcvc83f0Q7R0b3TcSfx+p7HJ5Lxe98=
X-Gm-Gg: AY/fxX49KKbEZgU5qRh4CXSTF95/YI0/53tvf8jQaaaw8nXctlI+6tMY+01VCWJ93hZ
 ZXv+pXs844C8ga0xynMHDXHm8X42PS1eQMSBRT4bpGLUqpB3WxjgLi5PNPes9/h4UKrd3NZtB7i
 ubbM7zrl3UpQNv3Qy0KKbf5YvbtxLhV8j52QGheSNPcvcDAV+G3/uxXehDqNmiNSZpxfGAZwxxL
 yjV1NeHz8uCDNc7cz8X/BS5AAA4PuCycFCgGpWC+nR4OLWtQTEynfzO39E7JBIWTUXmyCBTY8O0
 VgZYfhQGaVszZyrpc9iUgntd5mwjO8p/rxxtqvp9yWFsGnNjsHzMw4dDgcIXoOw6wZ6mMrmRKkU
 pJ2mrdEumn4B/Mvq7G9C+0XhYUjJ0FoFMpzD4woeJWghZkhj1ZbNXKk0sSZVE3ugdfhX+ut6bDE
 vt9BtDWrcW+K/vIBTEOoBtETb6BCz7N7OQJzlASyyC63rpLkyd79WofHoDuQ==
X-Google-Smtp-Source: AGHT+IF5kWl8asvVZ2gDn2/ukMC7FmJVzWuHgbBPUo4GSSTrWpKfiHxIiV3JEK3vNep6zj7EVQ2rxQ==
X-Received: by 2002:a17:907:a909:b0:b7c:cc8d:14ef with SMTP id
 a640c23a62f3a-b7d218d55fdmr1188092466b.32.1765808254923; 
 Mon, 15 Dec 2025 06:17:34 -0800 (PST)
Received: from localhost (ip-046-005-122-062.um12.pools.vodafone-ip.de.
 [46.5.122.62]) by smtp.gmail.com with UTF8SMTPSA id
 a640c23a62f3a-b7cfa56c152sm1380034166b.56.2025.12.15.06.17.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Dec 2025 06:17:34 -0800 (PST)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Jens Wiklander <jens.wiklander@linaro.org>,
 Jonathan Corbet <corbet@lwn.net>, Sumit Garg <sumit.garg@kernel.org>,
 Olivia Mackall <olivia@selenic.com>,
 Herbert Xu <herbert@gondor.apana.org.au>,
 =?utf-8?b?Q2zDqW1lbnQgTMOpZ2Vy?= <clement.leger@bootlin.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Ard Biesheuvel <ardb@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Sumit Garg <sumit.garg@oss.qualcomm.com>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>,
 Jan Kiszka <jan.kiszka@siemens.com>,
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
 Sudeep Holla <sudeep.holla@arm.com>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 =?utf-8?b?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
 Michael Chan <michael.chan@broadcom.com>,
 Pavan Chebbi <pavan.chebbi@broadcom.com>,
 James Bottomley <James.Bottomley@HansenPartnership.com>,
 Jarkko Sakkinen <jarkko@kernel.org>, Mimi Zohar <zohar@linux.ibm.com>,
 David Howells <dhowells@redhat.com>, Paul Moore <paul@paul-moore.com>,
 James Morris <jmorris@namei.org>, "Serge E. Hallyn" <serge@hallyn.com>,
 Peter Huewe <peterhuewe@gmx.de>
Date: Mon, 15 Dec 2025 15:16:30 +0100
Message-ID: <cover.1765791463.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3083;
 i=u.kleine-koenig@baylibre.com; h=from:subject:message-id;
 bh=KVuyHGeUtpLkpGJYZbfb5WtDJicjtg3giXBlS+vhN0U=;
 b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBpQBhBsL1Z+rYFoGFHUfEy6nbD85QotpwGnuS0G
 OxYNqNRFI2JATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCaUAYQQAKCRCPgPtYfRL+
 TugUB/9E31O/wKyUkNJNEPUiyayhLen3mT/3afyja8AKlZtLRRSDYD85SklWs8WUYR25f620Tug
 HCQFCBGP6zvWFDFUJWDts8iS5V7u/2f3fzK4EwWEIO8RjWf//RCGbcOXzrjD+gHhyiO4ntF2NWr
 3ospR0B/APcHFEMI3zfkmIaPNlyEhNrddsNRbaHKA+WTWhZm7A/yqOnVYIJ6MLuTrhjHLZZoL5u
 gBimMOyT/Dmu6TUF9ex7Rhk+vookCt9jpn+vbxsz0ArRtMIo0W8fVdouxPDFA9SMn/bCn6BBJ+B
 fl85F7WiQwNbfWoeC8/qrjWMCGDfxgyRZi39jRQ+nWgTC5V5
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp;
 fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Cc: linux-rtc@vger.kernel.org, linux-efi@vger.kernel.org,
 Cristian Marussi <cristian.marussi@arm.com>, linux-doc@vger.kernel.org,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mips@vger.kernel.org, Jason Gunthorpe <jgg@ziepe.ca>,
 linux-security-module@vger.kernel.org, op-tee@lists.trustedfirmware.org,
 keyrings@vger.kernel.org, linux-crypto@vger.kernel.org,
 arm-scmi@vger.kernel.org, linux-integrity@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v2 00/17] tee: Use bus callbacks instead of
	driver callbacks
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

SGVsbG8sCgp0aGUgb2JqZWN0aXZlIG9mIHRoaXMgc2VyaWVzIGlzIHRvIG1ha2UgdGVlIGRyaXZl
ciBzdG9wIHVzaW5nIGNhbGxiYWNrcwppbiBzdHJ1Y3QgZGV2aWNlX2RyaXZlci4gVGhlc2Ugd2Vy
ZSBzdXBlcnNlZGVkIGJ5IGJ1cyBtZXRob2RzIGluIDIwMDYKKGNvbW1pdCA1OTRjODI4MWY5MDUg
KCJbUEFUQ0hdIEFkZCBidXNfdHlwZSBwcm9iZSwgcmVtb3ZlLCBzaHV0ZG93bgptZXRob2RzLiIp
KSBidXQgbm9ib2R5IGNhcmVkIHRvIGNvbnZlcnQgYWxsIHN1YnN5c3RlbXMgYWNjb3JkaW5nbHku
CgpIZXJlIHRoZSB0ZWUgZHJpdmVycyBhcmUgY29udmVydGVkLiBUaGUgZmlyc3QgY29tbWl0IGlz
IHNvbWV3aGF0CnVucmVsYXRlZCwgYnV0IHNpbXBsaWZpZXMgdGhlIGNvbnZlcnNpb24gKGFuZCB0
aGUgZHJpdmVycykuIEl0CmludHJvZHVjZXMgZHJpdmVyIHJlZ2lzdHJhdGlvbiBoZWxwZXJzIHRo
YXQgY2FyZSBhYm91dCBzZXR0aW5nIHRoZSBidXMKYW5kIG93bmVyLiAoVGhlIGxhdHRlciBpcyBt
aXNzaW5nIGluIGFsbCBkcml2ZXJzLCBzbyBieSB1c2luZyB0aGVzZQpoZWxwZXJzIHRoZSBkcml2
ZXJzIGJlY29tZSBtb3JlIGNvcnJlY3QuKQoKdjEgb2YgdGhpcyBzZXJpZXMgaXMgYXZhaWxhYmxl
IGF0Cmh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2FsbC9jb3Zlci4xNzY1NDcyMTI1LmdpdC51Lmts
ZWluZS1rb2VuaWdAYmF5bGlicmUuY29tCgpDaGFuZ2VzIHNpbmNlIHYxOgoKIC0gcmViYXNlIHRv
IHY2LjE5LXJjMSAobm8gY29uZmxpY3RzKQogLSBhZGQgdGFncyByZWNlaXZlZCBzbyBmYXIKIC0g
Zml4IHdoaXRlc3BhY2UgaXNzdWVzIHBvaW50ZWQgb3V0IGJ5IFN1bWl0IEdhcmcKIC0gZml4IHNo
dXRkb3duIGNhbGxiYWNrIHRvIHNodXRkb3duIGFuZCBub3QgcmVtb3ZlCgpBcyBhbHJlYWR5IG5v
dGVkIGluIHYxJ3MgY292ZXIgbGV0dGVyLCB0aGlzIHNlcmllcyBzaG91bGQgZ28gaW4gZHVyaW5n
IGEKc2luZ2xlIG1lcmdlIHdpbmRvdyBhcyB0aGVyZSBhcmUgcnVudGltZSB3YXJuaW5ncyB3aGVu
IHRoZSBzZXJpZXMgaXMKb25seSBhcHBsaWVkIHBhcnRpYWxseS4gU3VtaXQgR2FyZyBzdWdnZXN0
ZWQgdG8gYXBwbHkgdGhlIHdob2xlIHNlcmllcwp2aWEgSmVucyBXaWtsYW5kZXIncyB0cmVlLgpJ
ZiB0aGlzIGlzIGRvbmUgdGhlIGRlcGVuZGVuY2llcyBpbiB0aGlzIHNlcmllcyBhcmUgaG9ub3Jl
ZCwgaW4gY2FzZSB0aGUKcGxhbiBjaGFuZ2VzOiBQYXRjaGVzICM0IC0gIzE3IGRlcGVuZCBvbiB0
aGUgZmlyc3QgdHdvLgoKTm90ZSB0aGlzIHNlcmllcyBpcyBvbmx5IGJ1aWxkIHRlc3RlZC4KClV3
ZSBLbGVpbmUtS8O2bmlnICgxNyk6CiAgdGVlOiBBZGQgc29tZSBoZWxwZXJzIHRvIHJlZHVjZSBi
b2lsZXJwbGF0ZSBmb3IgdGVlIGNsaWVudCBkcml2ZXJzCiAgdGVlOiBBZGQgcHJvYmUsIHJlbW92
ZSBhbmQgc2h1dGRvd24gYnVzIGNhbGxiYWNrcyB0byB0ZWVfY2xpZW50X2RyaXZlcgogIHRlZTog
QWRhcHQgZG9jdW1lbnRhdGlvbiB0byBjb3ZlciByZWNlbnQgYWRkaXRpb25zCiAgaHdybmc6IG9w
dGVlIC0gTWFrZSB1c2Ugb2YgbW9kdWxlX3RlZV9jbGllbnRfZHJpdmVyKCkKICBod3JuZzogb3B0
ZWUgLSBNYWtlIHVzZSBvZiB0ZWUgYnVzIG1ldGhvZHMKICBydGM6IG9wdGVlOiBNaWdyYXRlIHRv
IHVzZSB0ZWUgc3BlY2lmaWMgZHJpdmVyIHJlZ2lzdHJhdGlvbiBmdW5jdGlvbgogIHJ0Yzogb3B0
ZWU6IE1ha2UgdXNlIG9mIHRlZSBidXMgbWV0aG9kcwogIGVmaTogc3RtbTogTWFrZSB1c2Ugb2Yg
bW9kdWxlX3RlZV9jbGllbnRfZHJpdmVyKCkKICBlZmk6IHN0bW06IE1ha2UgdXNlIG9mIHRlZSBi
dXMgbWV0aG9kcwogIGZpcm13YXJlOiBhcm1fc2NtaTogb3B0ZWU6IE1ha2UgdXNlIG9mIG1vZHVs
ZV90ZWVfY2xpZW50X2RyaXZlcigpCiAgZmlybXdhcmU6IGFybV9zY21pOiBNYWtlIHVzZSBvZiB0
ZWUgYnVzIG1ldGhvZHMKICBmaXJtd2FyZTogdGVlX2JueHQ6IE1ha2UgdXNlIG9mIG1vZHVsZV90
ZWVfY2xpZW50X2RyaXZlcigpCiAgZmlybXdhcmU6IHRlZV9ibnh0OiBNYWtlIHVzZSBvZiB0ZWUg
YnVzIG1ldGhvZHMKICBLRVlTOiB0cnVzdGVkOiBNaWdyYXRlIHRvIHVzZSB0ZWUgc3BlY2lmaWMg
ZHJpdmVyIHJlZ2lzdHJhdGlvbgogICAgZnVuY3Rpb24KICBLRVlTOiB0cnVzdGVkOiBNYWtlIHVz
ZSBvZiB0ZWUgYnVzIG1ldGhvZHMKICB0cG0vdHBtX2Z0cG1fdGVlOiBNYWtlIHVzZSBvZiB0ZWUg
c3BlY2lmaWMgZHJpdmVyIHJlZ2lzdHJhdGlvbgogIHRwbS90cG1fZnRwbV90ZWU6IE1ha2UgdXNl
IG9mIHRlZSBidXMgbWV0aG9kcwoKIERvY3VtZW50YXRpb24vZHJpdmVyLWFwaS90ZWUucnN0ICAg
ICAgICAgICAgIHwgMTggKy0tLS0KIGRyaXZlcnMvY2hhci9od19yYW5kb20vb3B0ZWUtcm5nLmMg
ICAgICAgICAgIHwgMjYgKystLS0tCiBkcml2ZXJzL2NoYXIvdHBtL3RwbV9mdHBtX3RlZS5jICAg
ICAgICAgICAgICB8IDMxICsrKysrLS0tCiBkcml2ZXJzL2Zpcm13YXJlL2FybV9zY21pL3RyYW5z
cG9ydHMvb3B0ZWUuYyB8IDMyICsrKy0tLS0tCiBkcml2ZXJzL2Zpcm13YXJlL2Jyb2FkY29tL3Rl
ZV9ibnh0X2Z3LmMgICAgICB8IDMwICsrLS0tLS0KIGRyaXZlcnMvZmlybXdhcmUvZWZpL3N0bW0v
dGVlX3N0bW1fZWZpLmMgICAgIHwgMjUgKystLS0tCiBkcml2ZXJzL3J0Yy9ydGMtb3B0ZWUuYyAg
ICAgICAgICAgICAgICAgICAgICB8IDI3ICsrLS0tLS0KIGRyaXZlcnMvdGVlL3RlZV9jb3JlLmMg
ICAgICAgICAgICAgICAgICAgICAgIHwgODQgKysrKysrKysrKysrKysrKysrKysKIGluY2x1ZGUv
bGludXgvdGVlX2Rydi5oICAgICAgICAgICAgICAgICAgICAgIHwgMTIgKysrCiBzZWN1cml0eS9r
ZXlzL3RydXN0ZWQta2V5cy90cnVzdGVkX3RlZS5jICAgICB8IDE3ICsrLS0KIDEwIGZpbGVzIGNo
YW5nZWQsIDE2NCBpbnNlcnRpb25zKCspLCAxMzggZGVsZXRpb25zKC0pCgpiYXNlLWNvbW1pdDog
OGYwYjRjY2U0NDgxZmIyMjY1MzY5N2NjZWQ4ZDBkMDQwMjdjYjFlOAotLSAKMi40Ny4zCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBt
YWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRw
czovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1z
dG0zMgo=
