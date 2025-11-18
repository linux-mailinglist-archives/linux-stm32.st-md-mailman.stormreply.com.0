Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 07645C6A6F7
	for <lists+linux-stm32@lfdr.de>; Tue, 18 Nov 2025 16:55:30 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BE011C62D56;
	Tue, 18 Nov 2025 15:55:29 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com
 [209.85.128.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 66524C62D20
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 18 Nov 2025 15:09:04 +0000 (UTC)
Received: by mail-wm1-f46.google.com with SMTP id
 5b1f17b1804b1-477a219dbcaso21495105e9.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 18 Nov 2025 07:09:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1763478544; x=1764083344;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=1aUWB5rfJH8WjlZ6mpwncNQxfl3NZrrgQFt7PCfUFlA=;
 b=kwKDfwJuIbKnoY54h0rvHi8QRorafXM0cQ7mY1WSNU7szaeWiBbEYOGo/DmmBExk2c
 PqT6n7Dr7uNlrOLD2/gdt2Z3esQZiqQULXwB987pi4h/j1x7C5cfYjf+1sZ9PZkb/y5k
 ytL/bC2nv9rpuROojjd61d5BsVkV4/Za4laBwxgksHZezCfwSj7lSTvAvhgYWFZBr2cj
 tGTugjFyaZ9k0/xg++CbPyquKR1gVkzOGc0Dp39cZmLTOeammm5YruF6Uc2vzHn7c6bP
 cGjbt/dcTwQ8tlifHWMKGceswi0pV55TFt/XBZycyHVNc4A7liSIdj1Nz1YKh8eYGvYF
 4fEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763478544; x=1764083344;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=1aUWB5rfJH8WjlZ6mpwncNQxfl3NZrrgQFt7PCfUFlA=;
 b=wZ2CRx2LjtMHW3ensaM7ksWVFWgjRekyhOwVlZDOFi5JyW8xYoIvtrRLfnhTt0qg0w
 jVB2kkmDRdwd89smjCB729/qVCw1g5xhjZB90ooPfYFuUX9UHs0bp93CmUXYaeElstun
 S1EoLpQOwfMW7Z9eHcrIi7rMKU83Q/IRmhz7MHzqh8X+XdQxJxzsO8QIlxmOhuFxrIE9
 LnFsUPBOlu1ec13TiD69hfNTbFdT0uQy5jqtnXi16dsjo7QEPyI6MmBSjnpoc8H0kvCl
 3DXUv/EmqBjCB2OYEnkx+OXyeU8tDApK/W8tlyquVUxMt9KgHosCfjQfz/yshKqiI8q5
 Jg4w==
X-Forwarded-Encrypted: i=1;
 AJvYcCXtQxWswg3SSsnRfijUChvyCucGFURk/wCBFNAMmlDiAqNuIcMkpv1n8lqw5iNL6KSKAjnVOCFxzBUl3w==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YzUloh2ow5zRCJdScKperGi2jZegIYVm0DOWE7GlaQKYMtm4Kdy
 pT6rf2f7UJxLDGR0E8nu/YHKqSxxm6XkpbxIrbp6jYe45pPKJwU4P5P1
X-Gm-Gg: ASbGncukgOV5CSagZaZKFJ38QtWPXo9fa9NdmqGBKnQnZ2rfGGN+OcAXcw4J64f/5vH
 lWi2k7i/0Jsrzze0IbO8PL+gWmRsLkJ7Qie+3b0HHTTyse4YbZ3dqH2J/vrsR7aGMz68iMOtIIP
 06N0Bp7zGKb/YWbCvKFFXDeYc9uuWYtGQuUlc267CcXpNMpPjDy4+OoXZPTF+A7KCJzFUKUgMDw
 j2wiknRUw6lOEc4PsHes5AxQiFVS0EuuQqN0kPtjf5nzjNp6CFau6DWIJa0sk+aQv9E0yypFdNW
 YAg1lOCkOCtYPqK9gpJgaOapZ/WhHlk7LCRZ0wCJVRfV+cwbucSsN4ApC5BNk73s1AP3vgngx1R
 jUWH4bKMaZNiFNi4KV987NYiFg8iOVeOEhSwXjX43ca3WbjjsV/Ankfk0vMAM7Qh8Cpk5xhLRYe
 j+mxESIghj4s+cvlmivY8IrTvZsS09t5TFUI6HMe01dff+QH8nIUsieSkOs7XuOPpZx7LfuC/Fs
 YGzAOfAkkIkDjNH
X-Google-Smtp-Source: AGHT+IGSEH+nZH3uDYlPARqsVIhZYpdp0LW2A5ByNrQdTilynl5MJD0kTuaNse/eSWnTTSY+SA+8rw==
X-Received: by 2002:a05:6000:2c0f:b0:42b:3592:1b82 with SMTP id
 ffacd0b85a97d-42b5933e152mr14529598f8f.1.1763478543680; 
 Tue, 18 Nov 2025 07:09:03 -0800 (PST)
Received: from localhost (2a02-842a-9b20-0d01-432b-0dab-f195-2b25.rev.sfr.net.
 [2a02:842a:9b20:d01:432b:dab:f195:2b25])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-42b53f206e2sm33027151f8f.41.2025.11.18.07.09.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Nov 2025 07:09:03 -0800 (PST)
From: =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <legoffic.clement@gmail.com>
Date: Tue, 18 Nov 2025 16:08:03 +0100
MIME-Version: 1.0
Message-Id: <20251118-b4-ddr-bindings-v9-7-a033ac5144da@gmail.com>
References: <20251118-b4-ddr-bindings-v9-0-a033ac5144da@gmail.com>
In-Reply-To: <20251118-b4-ddr-bindings-v9-0-a033ac5144da@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Julius Werner <jwerner@chromium.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>
X-Mailer: b4 0.15-dev-86b30
X-Mailman-Approved-At: Tue, 18 Nov 2025 15:55:27 +0000
Cc: devicetree@vger.kernel.org,
 =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clement.legoffic@foss.st.com>,
 linux-kernel@vger.kernel.org,
 =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <legoffic.clement@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v9 7/7] arm64: dts: st: add DDR channel to
 stm32mp257f-ev1 board
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

RnJvbTogQ2zDqW1lbnQgTGUgR29mZmljIDxjbGVtZW50LmxlZ29mZmljQGZvc3Muc3QuY29tPgoK
QWRkIDMyYml0cyBERFI0IGNoYW5uZWwgdG8gdGhlIHN0bTMybXAyNTdmLWRrIGJvYXJkLgoKU2ln
bmVkLW9mZi1ieTogQ2zDqW1lbnQgTGUgR29mZmljIDxjbGVtZW50LmxlZ29mZmljQGZvc3Muc3Qu
Y29tPgpTaWduZWQtb2ZmLWJ5OiBDbMOpbWVudCBMZSBHb2ZmaWMgPGxlZ29mZmljLmNsZW1lbnRA
Z21haWwuY29tPgotLS0KIGFyY2gvYXJtNjQvYm9vdC9kdHMvc3Qvc3RtMzJtcDI1N2YtZXYxLmR0
cyB8IDcgKysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdp
dCBhL2FyY2gvYXJtNjQvYm9vdC9kdHMvc3Qvc3RtMzJtcDI1N2YtZXYxLmR0cyBiL2FyY2gvYXJt
NjQvYm9vdC9kdHMvc3Qvc3RtMzJtcDI1N2YtZXYxLmR0cwppbmRleCA2ZTE2NTA3M2Y3MzIuLjg0
ZWIwOWY4Yjg3OCAxMDA2NDQKLS0tIGEvYXJjaC9hcm02NC9ib290L2R0cy9zdC9zdG0zMm1wMjU3
Zi1ldjEuZHRzCisrKyBiL2FyY2gvYXJtNjQvYm9vdC9kdHMvc3Qvc3RtMzJtcDI1N2YtZXYxLmR0
cwpAQCAtNDIsNiArNDIsMTMgQEAgcGFkX2NsazogcGFkLWNsayB7CiAJCX07CiAJfTsKIAorCWRk
cl9jaGFubmVsOiBzZHJhbS1jaGFubmVsLTAgeworCQkjYWRkcmVzcy1jZWxscyA9IDwxPjsKKwkJ
I3NpemUtY2VsbHMgPSA8MD47CisJCWNvbXBhdGlibGUgPSAiamVkZWMsZGRyNC1jaGFubmVsIjsK
KwkJaW8td2lkdGggPSA8MzI+OworCX07CisKIAlpbXgzMzVfMnY5OiByZWd1bGF0b3ItMnY5IHsK
IAkJY29tcGF0aWJsZSA9ICJyZWd1bGF0b3ItZml4ZWQiOwogCQlyZWd1bGF0b3ItbmFtZSA9ICJp
bXgzMzUtYXZkZCI7CgotLSAKMi40My4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3Qt
bWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBs
eS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
