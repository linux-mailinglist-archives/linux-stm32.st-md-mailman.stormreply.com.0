Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 95823C3BD21
	for <lists+linux-stm32@lfdr.de>; Thu, 06 Nov 2025 15:42:21 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3DD7AC5C842;
	Thu,  6 Nov 2025 14:42:21 +0000 (UTC)
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id F2F99C36B30
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  6 Nov 2025 14:42:20 +0000 (UTC)
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1762440140;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=FOOLV+Wt6cHX8IB56gpRGewt+8/m8I9TnkK1yGUVBrw=;
 b=PAy1N3a7SmuG/It82kUVWs7XH1XoUuU2LBMSWsQe92MYeMc6fMk99Oh2ED4REz0DfKwJ7e
 snLOGoEi+h6rxH1AToYSm6dkyPydDkO9dEhJ0bOdYmPxSj+iypgGI75fBIGHPJdOZkuoCe
 J3ncdAZaHl51xGEEOuBW2HDMRjfxWhiDWeakQoYNgDOIo8S1zvb/OqDN/npoehXCUnH4qV
 xniuDaI04M6z6lU8oswSbqY6Y1ekuPeEk1+ENq4jwYiWlFalpdYVZ3dEiOgXqfBiPT62Ep
 /Ty/UZRoQ9t5mouKRmdM0FJr6c4Apvnuk0qFSYyrJLz7Q+xkW6Clx7W9w0lx9A==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1762440140;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=FOOLV+Wt6cHX8IB56gpRGewt+8/m8I9TnkK1yGUVBrw=;
 b=ii6JmfXp0RoYt2PeZHZB0fv0OUb2E/wmb9jj0+DNATMOesrbqgHuWyzipDdk8KyujH9YzS
 JK0cxBo5oSub6nBw==
Date: Thu, 06 Nov 2025 15:41:57 +0100
MIME-Version: 1.0
Message-Id: <20251106-restricted-pointers-stm-v1-1-7d03eb5020ba@linutronix.de>
X-B4-Tracking: v=1; b=H4sIALSzDGkC/x3MMQqAMAxA0atIZgNWrYhXEYfaRs1glaSIIN7d4
 viG/x9QEiaFoXhA6GLlI2aYsgC/ubgScsiGuqqtMVWHQpqEfaKA58ExkShq2tHOi2/70LjWW8j
 1KbTw/Z/H6X0/bulgGmkAAAA=
X-Change-ID: 20251106-restricted-pointers-stm-5bfc48d3a4c5
To: Olivier Moysan <olivier.moysan@foss.st.com>, 
 Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1762440134; l=1480;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=u3JHp/qpCUvTjf3bCgMmhxbdgh3vpao1Tq40kL7L4U4=;
 b=JX2/pGtnxIWSvsmEmArg+q9ng4flIkflN4nEGjJUT8CwoyuR9/ggaXsSr1SLyL16fci8pTktn
 zlfGtfCQCGcB4MC6P//HH2Iz7Zt1s9RNoqJx57MVyEwkMl2KPH6djk0
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
Cc: linux-arm-kernel@lists.infradead.org,
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>,
 linux-stm32@st-md-mailman.stormreply.com, linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [Linux-stm32] [PATCH] ASoC: stm32: dfsdm: don't use %pK through
	printk
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

SW4gdGhlIHBhc3QgJXBLIHdhcyBwcmVmZXJhYmxlIHRvICVwIGFzIGl0IHdvdWxkIG5vdCBsZWFr
IHJhdyBwb2ludGVyCnZhbHVlcyBpbnRvIHRoZSBrZXJuZWwgbG9nLgpTaW5jZSBjb21taXQgYWQ2
N2I3NGQyNDY5ICgicHJpbnRrOiBoYXNoIGFkZHJlc3NlcyBwcmludGVkIHdpdGggJXAiKQp0aGUg
cmVndWxhciAlcCBoYXMgYmVlbiBpbXByb3ZlZCB0byBhdm9pZCB0aGlzIGlzc3VlLgpGdXJ0aGVy
bW9yZSwgcmVzdHJpY3RlZCBwb2ludGVycyAoIiVwSyIpIHdlcmUgbmV2ZXIgbWVhbnQgdG8gYmUg
dXNlZAp0aHJvdWdoIHByaW50aygpLiBUaGV5IGNhbiBzdGlsbCB1bmludGVudGlvbmFsbHkgbGVh
ayByYXcgcG9pbnRlcnMgb3IKYWNxdWlyZSBzbGVlcGluZyBsb2NrcyBpbiBhdG9taWMgY29udGV4
dHMuCgpTd2l0Y2ggdG8gdGhlIHJlZ3VsYXIgcG9pbnRlciBmb3JtYXR0aW5nIHdoaWNoIGlzIHNh
ZmVyIGFuZAplYXNpZXIgdG8gcmVhc29uIGFib3V0LgoKU2lnbmVkLW9mZi1ieTogVGhvbWFzIFdl
acOfc2NodWggPHRob21hcy53ZWlzc3NjaHVoQGxpbnV0cm9uaXguZGU+Ci0tLQogc291bmQvc29j
L3N0bS9zdG0zMl9hZGZzZG0uYyB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigr
KSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL3NvdW5kL3NvYy9zdG0vc3RtMzJfYWRmc2Rt
LmMgYi9zb3VuZC9zb2Mvc3RtL3N0bTMyX2FkZnNkbS5jCmluZGV4IGM5MTRkMWM0Njg1MDE5ZWYx
ZmQ2NmFiOTJkNzNiZDA2Y2Y4ZDE0YTEuLjE3OTdhOTFmZWE3YWU4NTY3MWJhOTk5MWMyZjhiZmE4
YzlkMWNlOTIgMTAwNjQ0Ci0tLSBhL3NvdW5kL3NvYy9zdG0vc3RtMzJfYWRmc2RtLmMKKysrIGIv
c291bmQvc29jL3N0bS9zdG0zMl9hZGZzZG0uYwpAQCAtMTgwLDcgKzE4MCw3IEBAIHN0YXRpYyBp
bnQgc3RtMzJfYWZzZG1fcGNtX2NiKGNvbnN0IHZvaWQgKmRhdGEsIHNpemVfdCBzaXplLCB2b2lk
ICpwcml2YXRlKQogCQlzcmNfc2l6ZSA+Pj0gMTsKIAljdXJfc2l6ZSA9IHNyY19zaXplOwogCi0J
ZGV2X2RiZyhydGQtPmRldiwgIiVzOiBidWZmX2FkZCA6JXBLLCBwb3MgPSAlZCwgc2l6ZSA9ICV6
dVxuIiwKKwlkZXZfZGJnKHJ0ZC0+ZGV2LCAiJXM6IGJ1ZmZfYWRkIDolcCwgcG9zID0gJWQsIHNp
emUgPSAlenVcbiIsCiAJCV9fZnVuY19fLCAmcGNtX2J1ZmZbcHJpdi0+cG9zXSwgcHJpdi0+cG9z
LCBzcmNfc2l6ZSk7CiAKIAlpZiAoKHByaXYtPnBvcyArIHNyY19zaXplKSA+IGJ1ZmZfc2l6ZSkg
ewoKLS0tCmJhc2UtY29tbWl0OiA3ZWEzMDk1OGIzMDU0ZjVlNDg4ZmEwYjMzYzM1MjcyM2Y3YWIz
YTJhCmNoYW5nZS1pZDogMjAyNTExMDYtcmVzdHJpY3RlZC1wb2ludGVycy1zdG0tNWJmYzQ4ZDNh
NGM1CgpCZXN0IHJlZ2FyZHMsCi0tIApUaG9tYXMgV2Vpw59zY2h1aCA8dGhvbWFzLndlaXNzc2No
dWhAbGludXRyb25peC5kZT4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWls
bWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
