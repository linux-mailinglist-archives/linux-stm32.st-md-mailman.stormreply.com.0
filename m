Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 992A593F82B
	for <lists+linux-stm32@lfdr.de>; Mon, 29 Jul 2024 16:35:12 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 32EF4C6DD96;
	Mon, 29 Jul 2024 14:35:12 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com
 [209.85.128.49])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 99E51C5E2CD
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 29 Jul 2024 14:35:05 +0000 (UTC)
Received: by mail-wm1-f49.google.com with SMTP id
 5b1f17b1804b1-42808071810so17452645e9.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 29 Jul 2024 07:35:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1722263705; x=1722868505;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Pf2db82vhdizcqTMN+1MBUArjDRrCG8c+iUPxc5CsU4=;
 b=sLhitiPsVv71Nbu6OjB7oBcqwddn1lPh8zsZtWg4xxrz2SchlmhhntnjoaFy0JwLVp
 TgmAS5mSV8gXPMWbbBtJWkKi6M9EzN/YW0qDtGT5O53Lj0WsqFZND7np882e1IWRRo6F
 gSSuXlHJYZPyKAbSJtx5DU4EHEFcWV0z4c4H9VOHMQ2Dh814NsRaCrNtUOBrA2xMYHP7
 iC+xda3PFNQ4HvL1BEU3BQbbiDhftYG0bpBWZZfTmqhudtVLqwSE5ycHbu3lu7Zudrs4
 J4/J/+mAl5RcbPBKxdyS1f8tF/MO9/Vu/lJAPWJwNg4hjRzcIwtPkG9oYGhej2M4S4z9
 xJhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1722263705; x=1722868505;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Pf2db82vhdizcqTMN+1MBUArjDRrCG8c+iUPxc5CsU4=;
 b=FHME6YLnE6SYLnc8Upqd0k60/YMHWYTD1ZJUhCira3D8W63ksPZxx0CTLFweuO7exK
 U3QOb8kQ1l0TMckyZ9F4xvRei6he8ZfvgMmPy3n/Jiy70av/SBPiA73bqaQvxQR0bcih
 h+OUB8zHqTGSZsyuBWWl7HTO/BSEddeUEvljWoPgf9UeA3M+sKsuLadDxW+xBoRTkFzd
 idzolcNoaP4QqYfHr7uqRct9naGtr65RuMs1KuqtflvhhvN7N/YDj1/o5k+oLKjs0GCT
 Tn01CNuT0LRche4b1Ay/CZz93/zFPFw8omyI6dfKns1Kya7w7xCDNT/QfZ3U9masPleH
 sVcg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWuoy6Vp8Bfuw96+lIcMlM721W0uZeHwio9vIVegxwkfrOVp0DCD2nhBKc2EQf4reJK7dZcxn1cGlo66NzmE3TJcbvnuyFKyRWYX2CxHzYFvHQEyy0CiFfO
X-Gm-Message-State: AOJu0YxqyE0DTxpG8W1GHUZZ16qp+oDsu2GlyCQBWlZgHySzsO2cd/MR
 pGVMlV2UeYGtxnIMFzpk8TkapYzidbigT46C8FvUF6zPRVCR6RPk1Gb1rzo9MsE=
X-Google-Smtp-Source: AGHT+IGt6eS97Xgca8KV0NOgFfHn5nHcp4nZrPormB0sSwBcBc31n8q1yejiOGdqCUHmIOkFibwqOw==
X-Received: by 2002:a05:600c:4511:b0:427:abed:3602 with SMTP id
 5b1f17b1804b1-42811e12d41mr57503285e9.24.1722263704828; 
 Mon, 29 Jul 2024 07:35:04 -0700 (PDT)
Received: from localhost ([2a02:8071:b783:6940:59dd:510e:47d0:643f])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4280a867e7esm135348575e9.27.2024.07.29.07.35.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Jul 2024 07:35:04 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: linux-pwm@vger.kernel.org, Steven Rostedt <rostedt@goodmis.org>,
 Masami Hiramatsu <mhiramat@kernel.org>
Date: Mon, 29 Jul 2024 16:34:16 +0200
Message-ID: <cover.1722261050.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3152;
 i=u.kleine-koenig@baylibre.com; h=from:subject:message-id;
 bh=5lbmiKqvBboL1pVsuj1bTn4xbLJ3cUxP0YgCBw+dVpI=;
 b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBmp6hqpBrMchkTq7UblpQiiB/gXoWgj5QCpOMh5
 UeL+gmP5SWJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZqeoagAKCRCPgPtYfRL+
 TlqNB/9IGnXLN9EXn6TBjOIgvmlIXGnB8Qjq58LozRpFWTT6bUlCZDNhYGIClk+Gc1Pz+lGVx7+
 4bVNReS62OkAxag/y/JjyVittMs1CR++VAuDxsMtxT7nCUVGYoXGS3AClsDjJQUgYHMv4HNaCHH
 NvpiitBaP2ro3UIlBLtsUrDVYSzsrK5VBtb+EKUAGC4i1BZvUV6DfJhiKLiX4THlPnxcjMlxrE/
 8AI1yyGUL+dEFeAKwhF+ezl5z5gunHggAc1DUrIO6Nw+R+8zhX/I4ZM8Lnnevce03fLD2Zdu7eB
 zCBFbI6JTMZCR1kU4Oz9fqKJBo2ugwZfCYLmi49CCy/9iEKu
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp;
 fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Cc: Trevor Gamblin <tgamblin@baylibre.com>,
 Michael Hennerich <michael.hennerich@analog.com>,
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-trace-kernel@vger.kernel.org
Subject: [Linux-stm32] [PATCH v3 0/8] pwm: New abstraction and userspace API
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

SGVsbG8sCgpoZXJlIGNvbWVzIHYzIG9mIHRoZSBzZXJpZXMgdG8gYWRkIHN1cHBvcnQgZm9yIGR1
dHkgb2Zmc2V0IGluIFBXTQp3YXZlZm9ybXMuIEZvciBhIHNpbmdsZSBQV00gb3V0cHV0IHRoZXJl
IGlzIG5vIGdhaW4sIGJ1dCBpZiB5b3UgaGF2ZSBhCmNoaXAgd2l0aCB0d28gKG9yIG1vcmUpIG91
dHB1dHMgYW5kIGJvdGggb3BlcmF0ZSB3aXRoIHRoZSBzYW1lIHBlcmlvZCwKeW91IGNhbiBnZW5l
cmF0ZSBhbiBvdXRwdXQgbGlrZToKCgogICAgICAgICAgICAgICBfX19fX18gICAgICAgICBfX19f
X18gICAgICAgICBfX19fX18gICAgICAgICBfX19fX18KICAgUFdNICMwICBfX18vICAgICAgXF9f
X19fX18vICAgICAgXF9fX19fX18vICAgICAgXF9fX19fX18vICAgICAgXF9fX19fX18KICAgICAg
ICAgICAgICAgICBfXyAgICAgICAgICAgICBfXyAgICAgICAgICAgICBfXyAgICAgICAgICAgICBf
XyAgICAKICAgUFdNICMxICBfX19fXy8gIFxfX19fX19fX19fXy8gIFxfX19fX19fX19fXy8gIFxf
X19fX19fX19fXy8gIFxfX19fX19fX18KICAgICAgICAgICAgICBeICAgICAgICAgICAgICBeICAg
ICAgICAgICAgICBeICAgICAgICAgICAgICBeCgpDaGFuZ2VzIHNpbmNlIHYyLCB3aGljaCBpcyBh
dmFpbGFibGUgZnJvbQpodHRwczovL2xvcmUua2VybmVsLm9yZy9saW51eC1wd20vY292ZXIuMTcy
MTA0MDg3NS5naXQudS5rbGVpbmUta29lbmlnQGJheWxpYnJlLmNvbQppbmNsdWRlOgoKIC0gRGVn
cmFkZSBhIGRldl9hbGVydCgpIHRvIGRldl93YXJuKCkgb24gZmVlZGJhY2sgYnkgRGF2aWQgTGVj
aG5lcgoKIC0gSW1wcm92ZW1lbnQgb2YgdmFyaW91cyBjb21tZW50cyAocGFydGx5IGluIHJlcGx5
IHRvIERhdmlkIExlY2huZXIpCgogLSBBZGQgX25zIHN1ZmZpeGVzIGZvciBtZW1iZXJzIG9mIHB3
bV93YXZlZm9ybSwgdGhhbmtzIERhdmlkIGZvciB0aGF0IHN1Z2dlc3Rpb24uCgogLSBSZWJhc2Vk
IHRvIHY2LjExLXJjMSArIHB3bS9mb3ItbmV4dC4KCkJlY2F1c2Ugb2YgdGhlc2UgY2hhbmdlcyBJ
IGRpZG4ndCBhZGQgVHJldm9yJ3MgUmV2aWV3ZWQtYnkgdGFnIGZvciBwYXRjaAojMy4KCkkga2Vw
dCB0aGUgQlVHX09Ocy4gVGhlcmUgYXJlIGEgZmV3IGNoZWNrX3BhdGNoIHdhcm5pbmdzIGFib3V0
IGl0LCBidXQgSSBzdGlsbApwcmVmZXIgdGhlc2UgZ2l2ZW4gdGhhdCBpdCBpcyBzYWZlIHRoZXkg
ZG9uJ3QgdHJpZ2dlciB3aXRob3V0IGZ1cnRoZXIgKGJvZ3VzKQpjb2RlIGNoYW5nZXMgYW5kIHdo
ZW4gdGhleSB0cmlnZ2VyIGNyYXNoaW5nIGVhcmx5IGlzIGJldHRlciB0aGFuIHN0YWNrCmNvcnJ1
cHRpb24uIEFsc28gY2hlY2twYXRjaCB0ZWxscwogICAgICAgIFdBUk5JTkc6IENvbXBhcmlzb25z
IHNob3VsZCBwbGFjZSB0aGUgY29uc3RhbnQgb24gdGhlIHJpZ2h0IHNpZGUgb2YgdGhlIHRlc3QK
ICAgICAgICAjMTU4OiBGSUxFOiBkcml2ZXJzL3B3bS9jb3JlLmM6MjYyOgogICAgICAgICsgICAg
ICAgQlVHX09OKFdGSFdTSVpFIDwgb3BzLT5zaXplb2Zfd2Zodyk7CgpCdXQgYXMgdGhlIEJVR19P
TiBpcyBhYm91dCBXRkhXU0laRSBiZWluZyB3cm9uZywgdGhpcyBvcmRlciBpcyBPSy4KClRoZXJl
IGFyZSBhIGZldyBtb3JlIGNoZWNrcGF0Y2ggd2FybmluZ3MgYWJvdXQgbGluZSBsZW5ndGhzLiBC
cmVha2luZwp0aGUgY3JpdGljaXNlZCBsaW5lcyBmdXJ0aGVyIGh1cnRzIHJlYWRhYmlsaXR5IElN
SE8sIHNvIEkga2VwdCB0aGVtLiBJdApnZXRzIGEgYml0IGJldHRlciBvbmNlIHN0bTMyX3B3bV9t
dWxfdTY0X3U2NF9kaXZfdTY0X3JvdW5kdXAoKSBpcwppbXBsZW1lbnRlZCAod2l0aG91dCB0aGUg
c3RtMzJfcHdtIHByZWZpeCkgYWxvbmdzaWRlCm11bF91NjRfdTY0X2Rpdl91NjQoKSBpbiBsaWIv
bWF0aC9kaXY2NC5jLCBidXQgSSBkb24ndCB3YW50IHRvIHdhaXQgZm9yCnRoYXQuIEkgd2lsbCBh
ZGRyZXNzIHRoYXQgb25jZSBOaWNvbGFzJ3MgcGF0Y2ggaW1wcm92aW5nIHByZWNpc2lvbiBvZgpt
dWxfdTY0X3U2NF9kaXZfdTY0KCkgbGFuZGVkLiAoSG1tLCBpdCdzIG5vdCBpbiBuZXh0IGFueSBt
b3JlIHNpbmNlCm5leHQtMjAyNDA3MjQsIGJlZm9yZSBpdCB3YXMgM2NjOGJmMWE4MWVmZGUxMDVk
OGU1NzM5OGNmODU1NGI1Nzc2ODc3NyArCmRiYmU5NWFmMGZhZDJhOWQyMmE0YjkxMGNmYzRiODc5
NDlkNjFhM2MpLgoKQmVzdCByZWdhcmRzClV3ZQoKVXdlIEtsZWluZS1Lw7ZuaWcgKDgpOgogIHB3
bTogU2ltcGxpZnkgcHdtX2NhcHR1cmUoKQogIHB3bTogQWRkIG1vcmUgbG9ja2luZwogIHB3bTog
TmV3IGFic3RyYWN0aW9uIGZvciBQV00gd2F2ZWZvcm1zCiAgcHdtOiBQcm92aWRlIG5ldyBjb25z
dW1lciBBUEkgZnVuY3Rpb25zIGZvciB3YXZlZm9ybXMKICBwd206IEFkZCBzdXBwb3J0IGZvciBw
d21jaGlwIGRldmljZXMgZm9yIGZhc3RlciBhbmQgZWFzaWVyIHVzZXJzcGFjZQogICAgYWNjZXNz
CiAgcHdtOiBBZGQgdHJhY2luZyBmb3Igd2F2ZWZvcm0gY2FsbGJhY2tzCiAgcHdtOiBheGktcHdt
Z2VuOiBJbXBsZW1lbnRhdGlvbiBvZiB0aGUgd2F2ZWZvcm0gY2FsbGJhY2tzCiAgcHdtOiBzdG0z
MjogSW1wbGVtZW50YXRpb24gb2YgdGhlIHdhdmVmb3JtIGNhbGxiYWNrcwoKIGRyaXZlcnMvcHdt
L2NvcmUuYyAgICAgICAgICAgfCA4MDkgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
LS0KIGRyaXZlcnMvcHdtL3B3bS1heGktcHdtZ2VuLmMgfCAxNTQgKysrKystLQogZHJpdmVycy9w
d20vcHdtLXN0bTMyLmMgICAgICB8IDYwNyArKysrKysrKysrKysrKysrLS0tLS0tLS0tLQogaW5j
bHVkZS9saW51eC9wd20uaCAgICAgICAgICB8ICA1OCArKy0KIGluY2x1ZGUvdHJhY2UvZXZlbnRz
L3B3bS5oICAgfCAxMzQgKysrKystCiBpbmNsdWRlL3VhcGkvbGludXgvcHdtLmggICAgIHwgIDI1
ICsrCiA2IGZpbGVzIGNoYW5nZWQsIDE0NzkgaW5zZXJ0aW9ucygrKSwgMzA4IGRlbGV0aW9ucygt
KQogY3JlYXRlIG1vZGUgMTAwNjQ0IGluY2x1ZGUvdWFwaS9saW51eC9wd20uaAoKYmFzZS1jb21t
aXQ6IGI5YjZiZDNkY2NlZWQzNzE4MjlhMDIyY2FlYjZiNTFjYjlmNjdiZTkKLS0gCjIuNDMuMAoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3Rt
MzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20K
aHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtc3RtMzIK
