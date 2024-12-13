Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6456A9F0656
	for <lists+linux-stm32@lfdr.de>; Fri, 13 Dec 2024 09:27:43 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 19B33C7801A;
	Fri, 13 Dec 2024 08:27:43 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B8302C7129D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 13 Dec 2024 06:00:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1734069625;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=TWteF4vrF1/pE81Ren4Vt30zPczJ6J6JzqVwaxLGNdQ=;
 b=RlykQvXJ2MbzKl81q/vTaA04ErSv3jsKpj5pO77bILWOwB87jCg4u9YJm72q8sftFynFK5
 5yaCXOCEkleIdxrsV0vqrUQLqL5ZGhdnpqAyRsGWputfFtdqaM9xw9qsLqtjAS8kxKbvlt
 4qSMJdKdMpkaNOLkNMtKO38w2H4ywYM=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-55-ACM5sE5qMqGFEyALKOVjLw-1; Fri, 13 Dec 2024 01:00:24 -0500
X-MC-Unique: ACM5sE5qMqGFEyALKOVjLw-1
X-Mimecast-MFC-AGG-ID: ACM5sE5qMqGFEyALKOVjLw
Received: by mail-ej1-f69.google.com with SMTP id
 a640c23a62f3a-aa676465b44so15310866b.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 12 Dec 2024 22:00:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734069623; x=1734674423;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=TWteF4vrF1/pE81Ren4Vt30zPczJ6J6JzqVwaxLGNdQ=;
 b=R1D6I0A1AXeAsJezX4/ZYKAJKIo5YT0mbG/9XNFIpMMa2X3rkrMFU29AruoevulfE0
 Vo5u/NkL/5B3obnEAzp4hB842twXyWQp8c80dhkmMt77zIGEx37E++IALN/mdEMWtJSf
 cN89iJ/TOy+5LVDzxXcOWX/eQinrVyFBRuGl3N/7RBDRkA+/+G3Xsr9tx00HyIi0Re/r
 yoflATWmgxh1NGBEVdm218WYLp93afqhDEPuuZaI5hu+TJijq9iVKJY8Tb83uK3HcDpH
 3eN3+xgxNXjmtz9CfE2gtucNWvwCjvmVKcYJ4sNkAPB0I+ND/n4EHWpLQT7gTucBnCzE
 GeLQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWSZswRAHGQ9IcSV7vyyzEZx3c9M5Ltj7Ey3PxsKmzxubJVQJZqUbFpulbO9G1UbSx7Twzmbwp7Cf6uKQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YzSzbouMTM2K8PbplGPonqRM58oYZCWnTiPkQhJuMhEfzV9Zbg1
 ZBIbcWzIpfxf+R1OVCKOxzOCHmz3kx7dtET+U6bTt3yZ9P0NCFuJ/Ec7qomgaJXs/fObUqXsqIC
 cwPON0Pkh+ovd7FHVRd0qDFDN3uF6gAhJvjmBF4z7cNJBfU+6us+PuRyp72rQNzlcKeAXoqaQ54
 cZOg==
X-Gm-Gg: ASbGncuQY1ro8zyMsl+IOFX2iF1CRVkNmxuC8Z6F9CRarOIeeG97KYyB6dtlo6l6mPH
 rxfSgKbGfQedpESk/edtItzCuOPqgIO0wQE0S/VVDNKBMfBC+/6QxkvuGabj/ThdGHwZVDDjFGs
 fRDwGADxe+/GUfwW6rWbWXcP+mJCoqAaIoEjOjn0omGtT4zfHDOUi2zXu3MOPv1OoiKSbYpzLRI
 YURyEZqGxmUC8SOo8WFH64oY4nnz/U2gb/b0pN6gQFlEvqaJGv96u/kSxHfH+4rCCP2jYuBqg+G
 EnKiSsOgcaM4EGeN0X+6kQdu5orI
X-Received: by 2002:a17:907:1ca3:b0:aab:7588:f411 with SMTP id
 a640c23a62f3a-aab779c8bcamr130015466b.25.1734069622966; 
 Thu, 12 Dec 2024 22:00:22 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGXwxJQVizGE5WgbyQd8OUq9Hy5FwjaQj5sQqA5agUSpWu1Zpe7/5Tw755l4EDxVsme0PEmFQ==
X-Received: by 2002:a17:907:1ca3:b0:aab:7588:f411 with SMTP id
 a640c23a62f3a-aab779c8bcamr130012766b.25.1734069622555; 
 Thu, 12 Dec 2024 22:00:22 -0800 (PST)
Received: from lbulwahn-thinkpadx1carbongen9.rmtde.csb
 ([2a02:810d:7e40:14b0:4ce1:e394:7ac0:6905])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aa689a0a6fcsm648156266b.30.2024.12.12.22.00.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Dec 2024 22:00:21 -0800 (PST)
From: Lukas Bulwahn <lbulwahn@redhat.com>
X-Google-Original-From: Lukas Bulwahn <lukas.bulwahn@redhat.com>
To: Alain Volmat <alain.volmat@foss.st.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Hans Verkuil <hverkuil@xs4all.nl>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 linux-media@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Date: Fri, 13 Dec 2024 07:00:11 +0100
Message-ID: <20241213060011.67797-1-lukas.bulwahn@redhat.com>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 4UdluykVub0dgoQbPpGXUn0cHFS0DtpyFIaBX-luDk4_1734069623
X-Mimecast-Originator: redhat.com
X-Mailman-Approved-At: Fri, 13 Dec 2024 08:27:42 +0000
Cc: Lukas Bulwahn <lukas.bulwahn@redhat.com>, kernel-janitors@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [Linux-stm32] [PATCH] MAINTAINERS: repair file entry in MEDIA
	DRIVERS FOR STM32 - CSI
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

RnJvbTogTHVrYXMgQnVsd2FobiA8bHVrYXMuYnVsd2FobkByZWRoYXQuY29tPgoKQ29tbWl0IGRj
YjBmNGMxNmJlNSAoIm1lZGlhOiBzdG0zMjogY3NpOiBhZGRpdGlvbiBvZiB0aGUgU1RNMzIgQ1NJ
IGRyaXZlciIpCmFkZHMgYSBuZXcgZHJpdmVyIGF0IGRyaXZlcnMvbWVkaWEvcGxhdGZvcm0vc3Qv
c3RtMzIvc3RtMzItY3NpLmMsIGJ1dApjcmVhdGVzIGEgbmV3IE1BSU5UQUlORVJTIHNlY3Rpb24g
TUVESUEgRFJJVkVSUyBGT1IgU1RNMzIgLSBDU0kgd2l0aCBhIGZpbGUKZW50cnkgcG9pbnRpbmcg
dG8gZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9zdG0zMi9zdG0zMi1jc2kuYy4gTm90ZSB0aGF0IHRo
ZQpmaWxlIGVudHJ5IGlzIG1pc3NpbmcgdGhlIOKAmHN04oCZIGRpcmVjdG9yeSBpbiBpdHMgcGF0
aC4KCkhlbmNlLCAuL3NjcmlwdHMvZ2V0X21haW50YWluZXIucGwgLS1zZWxmLXRlc3Q9cGF0dGVy
bnMgY29tcGxhaW5zIGFib3V0IGEKYnJva2VuIHJlZmVyZW5jZS4gUmVwYWlyIHRoaXMgZmlsZSBl
bnRyeSBpbiBNRURJQSBEUklWRVJTIEZPUiBTVE0zMiAtIENTSS4KClNpZ25lZC1vZmYtYnk6IEx1
a2FzIEJ1bHdhaG4gPGx1a2FzLmJ1bHdhaG5AcmVkaGF0LmNvbT4KLS0tCiBNQUlOVEFJTkVSUyB8
IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQoKZGlm
ZiAtLWdpdCBhL01BSU5UQUlORVJTIGIvTUFJTlRBSU5FUlMKaW5kZXggYmZmM2QzNWY4MGI1Li4y
MzBiN2E0ZWU5NWYgMTAwNjQ0Ci0tLSBhL01BSU5UQUlORVJTCisrKyBiL01BSU5UQUlORVJTCkBA
IC0xNDU1MSw3ICsxNDU1MSw3IEBAIEw6CWxpbnV4LW1lZGlhQHZnZXIua2VybmVsLm9yZwogUzoJ
U3VwcG9ydGVkCiBUOglnaXQgZ2l0Oi8vbGludXh0di5vcmcvbWVkaWFfdHJlZS5naXQKIEY6CURv
Y3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tZWRpYS9zdCxzdG0zMm1wMjUtY3NpLnlh
bWwKLUY6CWRyaXZlcnMvbWVkaWEvcGxhdGZvcm0vc3RtMzIvc3RtMzItY3NpLmMKK0Y6CWRyaXZl
cnMvbWVkaWEvcGxhdGZvcm0vc3Qvc3RtMzIvc3RtMzItY3NpLmMKIAogTUVESUEgRFJJVkVSUyBG
T1IgU1RNMzIgLSBEQ01JIC8gRENNSVBQCiBNOglIdWd1ZXMgRnJ1Y2hldCA8aHVndWVzLmZydWNo
ZXRAZm9zcy5zdC5jb20+Ci0tIAoyLjQ3LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBz
dC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJl
cGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
