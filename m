Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 883EBCB6A1D
	for <lists+linux-stm32@lfdr.de>; Thu, 11 Dec 2025 18:15:56 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 256B0C5F1FB;
	Thu, 11 Dec 2025 17:15:56 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
 [209.85.128.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1D552C3F944
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 11 Dec 2025 17:15:54 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id
 5b1f17b1804b1-477a2ab455fso4065045e9.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 11 Dec 2025 09:15:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1765473353; x=1766078153;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=EMUEsjsV+UnHdVdxs42rX4kdIiZsjjM1yfHblt+Kr5Q=;
 b=vfuWnj4tJ65xuHPEf64m3Cgzl/B9Mg+77ujIkAm1aRvbqlAHGoB30yrJ5m37DVByMc
 dEEeoon3oaWcqtJSLasxJDqCDjGbHBog3fRuE8oBl0mYi625m/tudcSdihrVtXZg6buE
 XqjwEF3jDiYbuR+BnYiG4GsmWADw2tvMoBslserl3rtlFusLjw2KdUDFPgLo6wldQ4Iv
 ivqWYnPZ6+zv0i3DMHDS72fj33IDjyVOFOBw4t2xuGKltJ+gnBW+3UL2gRmH8RriL+bZ
 Rt34sVdR8Ioae5W6Rq80769AIqxeLgZ84S6oH9mR5rnyx0E5YDa2OaJsa69D2K9lkAW5
 ucHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765473353; x=1766078153;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=EMUEsjsV+UnHdVdxs42rX4kdIiZsjjM1yfHblt+Kr5Q=;
 b=s1MRQxGLMH+E96oIxeOzNRH/rfnmRqV3TYRTTF7XqvkRkofARMq6wLWl4WvZke2a1K
 Gq/7L6WViZCRA7GGC53TOjSuZAuctonqOUOu84W75v6CEpqTqJGjxAeYo7reJqBZL6+K
 galexZHl3TYJ0nlUnh6MAtP7JtP2s/rigv7IMkBhzEMSAJi32Av0tg83pwBF63ofPLcu
 pqY3xdI5cqOhMHBVeEyrHumGcy/kF1UdkuvkQEYnFtaAJwy1fl+iTnqCiuHag5XH4ezp
 SC/RImIsiDV2jHSYKKuSZwmdCoJXeAN3AZqNWzOBmmXNUexXPaeEEp1pjitddyXycSgI
 ETmg==
X-Forwarded-Encrypted: i=1;
 AJvYcCV6UseB/mo8hFPmsCdEr6Tf6BuPKjXOQjsUuCdysjah3IRXaVgEJgCxhp3CQRNy/1De8ya1cmVfhyr6GQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yy0VdKFK+kqRcPLhJo9ODCif7Vv/FcVgaftWpLNbSKqhGfXeg7k
 ARVaaoCVT0Cv8heuNXliCZjqZrFvi9CfBRaPqsp0EgzjvVC4ogyArBjKq0SjgSEe1+E=
X-Gm-Gg: AY/fxX68sLSPgemp2c84IpznXyl/CCoZKV6+x5c7iKLc7MKHdeARVakN0xxtC+W3Jt9
 wpSDQVRl0SnO8icwJlBPb6bee4w+dh0X8yftDKiGK6zA0Zw+d4Y0fPz6R7uB9JTxcNzTydu6ZsA
 F6E8A9k0QWOzu31DnGwaDqjM4EJTwsolOritZ4WF0bjr4pnZqv9wEiUNOLbtRkK592Wp8zXdtwf
 BibPC4moPRuJ84ZWmiVtFH3dl9wbGNE81/dXrPj5bmXQHs55/TXXFqCn9lWStlRcNGUnDY3zNpO
 9r1wTeFAzVe8AOMd3OI+1mLbG49wrWIv9/xknGUMBItTypcMZeP76at7gz3JOKq/Ci+f33Y2qmD
 0vJMAdHQbQak5nmcDPTAKPDgKTZqwDhrvyzRRUkFv/jbPJEMVWH+bEq9meihR2zjmdJjmHSxeg5
 mhO/7enY3O45ixDq0VjYhpqLEhaRVxa/QZDJsxs7i/y8Muvh5fxzugOXslfiNcIaXsm00L+Qbp9
 og=
X-Google-Smtp-Source: AGHT+IH1WdB9lpe0Nt0W2bI91FzFVq1XhPopqcW3gxsnNR/pZMKlmmN+J4cQvorBXPFQhPdkhqM0qw==
X-Received: by 2002:a05:600c:1d0b:b0:477:7c45:87b2 with SMTP id
 5b1f17b1804b1-47a8375ae3dmr83804315e9.16.1765473353260; 
 Thu, 11 Dec 2025 09:15:53 -0800 (PST)
Received: from localhost
 (p200300f65f006608b66517f2bd017279.dip0.t-ipconnect.de.
 [2003:f6:5f00:6608:b665:17f2:bd01:7279])
 by smtp.gmail.com with UTF8SMTPSA id
 ffacd0b85a97d-42fa8a6fd62sm7327909f8f.10.2025.12.11.09.15.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Dec 2025 09:15:52 -0800 (PST)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Jens Wiklander <jens.wiklander@linaro.org>,
 Sumit Garg <sumit.garg@kernel.org>, Olivia Mackall <olivia@selenic.com>,
 Herbert Xu <herbert@gondor.apana.org.au>,
 =?utf-8?b?Q2zDqW1lbnQgTMOpZ2Vy?= <clement.leger@bootlin.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Ard Biesheuvel <ardb@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Sumit Garg <sumit.garg@oss.qualcomm.com>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>,
 Jan Kiszka <jan.kiszka@siemens.com>, Sudeep Holla <sudeep.holla@arm.com>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Michael Chan <michael.chan@broadcom.com>,
 Pavan Chebbi <pavan.chebbi@broadcom.com>,
 =?utf-8?b?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
 James Bottomley <James.Bottomley@HansenPartnership.com>,
 Jarkko Sakkinen <jarkko@kernel.org>, Mimi Zohar <zohar@linux.ibm.com>,
 David Howells <dhowells@redhat.com>, Paul Moore <paul@paul-moore.com>,
 James Morris <jmorris@namei.org>, "Serge E. Hallyn" <serge@hallyn.com>,
 Peter Huewe <peterhuewe@gmx.de>
Date: Thu, 11 Dec 2025 18:14:54 +0100
Message-ID: <cover.1765472125.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3006;
 i=u.kleine-koenig@baylibre.com; h=from:subject:message-id;
 bh=VskU/7ED+cd07+YT0cLSY6lSv8W33UJFXaXtUVFg16k=;
 b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBpOvwTkOdNXplS+sYyTfjIHP/A8Gme4RZEpqcXt
 diRkMgNgISJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCaTr8EwAKCRCPgPtYfRL+
 Tl1NCACRY8t0HOZ/pe2jgNYt83zctNNDYXhzu8cPsBYC6DoxIG7qbaEG/i2btzV7P9iWEXcGnaW
 iTW12DonZuA0Ys9v8JfYi5w/j0bn6FtrwKHIXypEwJzVzqmq0s9FhsPI+49irrtevJQOGtp/6FA
 ++4ZHclomZVYjG5ZORmnn0yLTtXHbQYEPcyHuzEEUvs+tHCIYIgkV7gzQ+qvpTw0lA+x5uFNqib
 OwGvVZIMvKV/HN70QhazY/X+w3FigDIT5y0g639i0H9JkEXX1mq5qRYi9kcC8z3WazU0iJ39L6Z
 w+blXNgg5fNZycKQ3GRhj80bk29PcQH7RHH6Vzov1GydnnYE
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp;
 fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Cc: linux-rtc@vger.kernel.org, linux-efi@vger.kernel.org,
 Cristian Marussi <cristian.marussi@arm.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
 Jason Gunthorpe <jgg@ziepe.ca>, linux-security-module@vger.kernel.org,
 op-tee@lists.trustedfirmware.org, keyrings@vger.kernel.org,
 linux-crypto@vger.kernel.org, arm-scmi@vger.kernel.org,
 linux-integrity@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v1 00/17] tee: Use bus callbacks instead of
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
ZXJzIGJlY29tZSBtb3JlIGNvcnJlY3QuKQoKVGhlIHBhdGNoZXMgIzQgLSAjMTcgZGVwZW5kIG9u
IHRoZSBmaXJzdCB0d28sIHNvIGlmIHRoZXkgc2hvdWxkIGJlCmFwcGxpZWQgdG8gdGhlaXIgcmVz
cGVjdGl2ZSBzdWJzeXN0ZW0gdHJlZXMgdGhlc2UgbXVzdCBjb250YWluIHRoZSBmaXJzdAp0d28g
cGF0Y2hlcyBmaXJzdC4KCk5vdGUgdGhhdCBhZnRlciBwYXRjaCAjMiBpcyBhcHBsaWVkLCB1bmNv
bnZlcnRlZCBkcml2ZXJzIHByb3Zva2UgYQp3YXJuaW5nIGluIGRyaXZlcl9yZWdpc3RlcigpLCBz
byBpdCB3b3VsZCBiZSBnb29kIGZvciB0aGUgdXNlcgpleHBlcmllbmNlIGlmIHRoZSB3aG9sZSBz
ZXJpZXMgZ29lcyBpbiBkdXJpbmcgYSBzaW5nbGUgbWVyZ2Ugd2luZG93LiBTbwpJIGd1ZXNzIGFu
IGltbXV0YWJsZSBicmFuY2ggY29udGFpbmluZyB0aGUgZnJpc3QgdGhyZWUgcGF0Y2hlcyB0aGF0
IGNhbgpiZSBtZXJnZWQgaW50byB0aGUgb3RoZXIgc3Vic3lzdGVtIHRyZWVzIHdvdWxkIGJlIHNl
bnNpYmxlLgoKQWZ0ZXIgYWxsIHBhdGNoZXMgYXJlIGFwcGxpZWQsIHRlZV9idXNfdHlwZSBjYW4g
YmUgbWFkZSBwcml2YXRlIHRvCmRyaXZlcnMvdGVlIGFzIGl0J3Mgbm90IHVzZWQgaW4gb3RoZXIg
cGxhY2VzIGFueSBtb3JlLgoKQmVzdCByZWdhcmRzClV3ZQoKVXdlIEtsZWluZS1Lw7ZuaWcgKDE3
KToKICB0ZWU6IEFkZCBzb21lIGhlbHBlcnMgdG8gcmVkdWNlIGJvaWxlcnBsYXRlIGZvciB0ZWUg
Y2xpZW50IGRyaXZlcnMKICB0ZWU6IEFkZCBwcm9iZSwgcmVtb3ZlIGFuZCBzaHV0ZG93biBidXMg
Y2FsbGJhY2tzIHRvIHRlZV9jbGllbnRfZHJpdmVyCiAgdGVlOiBBZGFwdCBkb2N1bWVudGF0aW9u
IHRvIGNvdmVyIHJlY2VudCBhZGRpdGlvbnMKICBod3JuZzogb3B0ZWUgLSBNYWtlIHVzZSBvZiBt
b2R1bGVfdGVlX2NsaWVudF9kcml2ZXIoKQogIGh3cm5nOiBvcHRlZSAtIE1ha2UgdXNlIG9mIHRl
ZSBidXMgbWV0aG9kcwogIHJ0Yzogb3B0ZWU6IE1pZ3JhdGUgdG8gdXNlIHRlZSBzcGVjaWZpYyBk
cml2ZXIgcmVnaXN0cmF0aW9uIGZ1bmN0aW9uCiAgcnRjOiBvcHRlZTogTWFrZSB1c2Ugb2YgdGVl
IGJ1cyBtZXRob2RzCiAgZWZpOiBzdG1tOiBNYWtlIHVzZSBvZiBtb2R1bGVfdGVlX2NsaWVudF9k
cml2ZXIoKQogIGVmaTogc3RtbTogTWFrZSB1c2Ugb2YgdGVlIGJ1cyBtZXRob2RzCiAgZmlybXdh
cmU6IGFybV9zY21pOiBvcHRlZTogTWFrZSB1c2Ugb2YgbW9kdWxlX3RlZV9jbGllbnRfZHJpdmVy
KCkKICBmaXJtd2FyZTogYXJtX3NjbWk6IE1ha2UgdXNlIG9mIHRlZSBidXMgbWV0aG9kcwogIGZp
cm13YXJlOiB0ZWVfYm54dDogTWFrZSB1c2Ugb2YgbW9kdWxlX3RlZV9jbGllbnRfZHJpdmVyKCkK
ICBmaXJtd2FyZTogdGVlX2JueHQ6IE1ha2UgdXNlIG9mIHRlZSBidXMgbWV0aG9kcwogIEtFWVM6
IHRydXN0ZWQ6IE1pZ3JhdGUgdG8gdXNlIHRlZSBzcGVjaWZpYyBkcml2ZXIgcmVnaXN0cmF0aW9u
CiAgICBmdW5jdGlvbgogIEtFWVM6IHRydXN0ZWQ6IE1ha2UgdXNlIG9mIHRlZSBidXMgbWV0aG9k
cwogIHRwbS90cG1fZnRwbV90ZWU6IE1ha2UgdXNlIG9mIHRlZSBzcGVjaWZpYyBkcml2ZXIgcmVn
aXN0cmF0aW9uCiAgdHBtL3RwbV9mdHBtX3RlZTogTWFrZSB1c2Ugb2YgdGVlIGJ1cyBtZXRob2Rz
CgogRG9jdW1lbnRhdGlvbi9kcml2ZXItYXBpL3RlZS5yc3QgICAgICAgICAgICAgfCAxOCArLS0t
LQogZHJpdmVycy9jaGFyL2h3X3JhbmRvbS9vcHRlZS1ybmcuYyAgICAgICAgICAgfCAyNiArKy0t
LS0KIGRyaXZlcnMvY2hhci90cG0vdHBtX2Z0cG1fdGVlLmMgICAgICAgICAgICAgIHwgMzEgKysr
KystLS0KIGRyaXZlcnMvZmlybXdhcmUvYXJtX3NjbWkvdHJhbnNwb3J0cy9vcHRlZS5jIHwgMzIg
KysrLS0tLS0KIGRyaXZlcnMvZmlybXdhcmUvYnJvYWRjb20vdGVlX2JueHRfZncuYyAgICAgIHwg
MzAgKystLS0tLQogZHJpdmVycy9maXJtd2FyZS9lZmkvc3RtbS90ZWVfc3RtbV9lZmkuYyAgICAg
fCAyNSArKy0tLS0KIGRyaXZlcnMvcnRjL3J0Yy1vcHRlZS5jICAgICAgICAgICAgICAgICAgICAg
IHwgMjcgKystLS0tLQogZHJpdmVycy90ZWUvdGVlX2NvcmUuYyAgICAgICAgICAgICAgICAgICAg
ICAgfCA4NCArKysrKysrKysrKysrKysrKysrKwogaW5jbHVkZS9saW51eC90ZWVfZHJ2LmggICAg
ICAgICAgICAgICAgICAgICAgfCAxMiArKysKIHNlY3VyaXR5L2tleXMvdHJ1c3RlZC1rZXlzL3Ry
dXN0ZWRfdGVlLmMgICAgIHwgMTcgKystLQogMTAgZmlsZXMgY2hhbmdlZCwgMTY0IGluc2VydGlv
bnMoKyksIDEzOCBkZWxldGlvbnMoLSkKCgpiYXNlLWNvbW1pdDogN2QwYTY2ZTRiYjkwODFkNzVj
ODJlYzQ5NTdjNTAwMzRjYjBlYTQ0OQotLSAKMi40Ny4zCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgt
c3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4u
c3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
