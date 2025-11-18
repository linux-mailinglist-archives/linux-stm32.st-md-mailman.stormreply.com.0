Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A597C6A6E9
	for <lists+linux-stm32@lfdr.de>; Tue, 18 Nov 2025 16:55:29 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 291FEC62D37;
	Tue, 18 Nov 2025 15:55:29 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com
 [209.85.221.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BB7E9C628DE
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 18 Nov 2025 15:08:58 +0000 (UTC)
Received: by mail-wr1-f46.google.com with SMTP id
 ffacd0b85a97d-42b3c965ca9so2840398f8f.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 18 Nov 2025 07:08:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1763478538; x=1764083338;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=vXSFON/1VQrHCM+f9FmS2ChuuEZCr9AFJjq4nQ/j5F0=;
 b=PqCHa1YfvjU7S3ITD+yodCPzrUfE2WUO+SCjX3w6l5GlrQK+60fCBsRHNUBvv7tzQW
 BqYywx3ILY+chbJSsQqCGslj7NRnQYSO8pH7WrVmlOfZ8pZWbnz+fvGjVtTPyLpUU8KT
 9X1IC8XvPfCSss2vE3lBtkiHeoAZxjqHqMUklH/hq615tskN4dKxeJTlXfgAU0iZVTZ3
 7zXkxmjHHdUYDK1JeFb68Mjqa2tz6oGyScdsbjdj5DQaNIPxAOxe3cvj4Cu0plWs+KuK
 KtZayD5BB/fw6xzq/Nxoss6ZDgFrrR+fAf+a53Uanwdbo+e/asaXeMQC6sJ+1WIqRnf4
 oCFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763478538; x=1764083338;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=vXSFON/1VQrHCM+f9FmS2ChuuEZCr9AFJjq4nQ/j5F0=;
 b=wG0byJuhydttTsgVA/IVfiTypZzvLC8wiXleSsqDwWkSc+FFV1BMrKQaqQjQTVtN/Y
 zl57BDg+Ea75BEL07CHPOpv+UyF1jmtzDWqscke8+Gj2R9ymbuJ0xctYopWoymzdQW10
 gQAfbOCam1aBa5sw6aF96l4YTf9cuIsyIIkE6aWHIpC8N+0gatdt+YPPYqzI3YJUmxFB
 +oaoHKtFLi9y0XehcLLoq0ATnKY4vPUkMsOTZqwARtyh8t6czM9Geg+DIE5GdZoilvFq
 9Tf/rPN8jQP1oLvBVsVbvNTXJEU1HK/uZ1/97BqXSGEdtFQn1asJUa9K+Ov7CFpExEsR
 qa4g==
X-Forwarded-Encrypted: i=1;
 AJvYcCUe3RoRCDGh6q8WbVvazwUYvmMqYp+P4iLIP4FZ4Gk3LPziKQTpJdI59AktH5Xwsgn44QQYbT27e8E44Q==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YwZJRxpCyvHJhn1yJ7Wqk6hVVqWlE7s0EXcYK0eyaL2AwYZrRNx
 ZAc9JAPBDgsYRoU2zsk5SOlCOSyUmS7Pe7Z/gJ2qJzIBZCpS2ezhFpIl
X-Gm-Gg: ASbGncteFyv3tHT5bNuunznqknDELfAJHVqaUpNs799s0WMg4JTpeOMPsqzQFst5Oww
 U1sgiX0009zXORo7W2dIoGSRB8nYeLWn78ahT7ocI+decZzZ8jx62Sg4xLzXyr8YjOkM++TuPXZ
 gODBUb/jZ8Oz02A6J0L1hVzWot3oXvDkS6+YKiiTi9KixxjKf2AH8Ta0UjPMnNsqi8XSq1hhQtE
 OhkREOukq6Xa6Px+ce4p8l0k2qdOAukHrBbXioFnmXkViwtPr4rXgacOFeMHc03tCQu2uo3Sfkr
 zzRAf5lrM1Eni28Jet3DqabcUmnYWO5VolOaX0vA2M3sCGh6vklRuFYTlltBoQdsh/MSkMbVajj
 jfJIU2L8LVfN8Uxg+Ph4dNCkuNjw3mEs4xqT8/LXNifk/2cHQZ83p/KHvU6m+gCpnrna53KAlwh
 htJPCef1HnnxOQvLKwZ6TsqerxIN5RBAhz/eJqNOojWKpfu6voKae/1rFtTDfa6ji08j4=
X-Google-Smtp-Source: AGHT+IEUJJGCTrmMLvsniUV7hiBdNMRfXZvya+c/u+hMC4mF96bJTPI256APV6+JR6pYbekvFc8AOA==
X-Received: by 2002:a05:6000:2f83:b0:42b:3ee9:4772 with SMTP id
 ffacd0b85a97d-42b5937618emr15137124f8f.52.1763478538022; 
 Tue, 18 Nov 2025 07:08:58 -0800 (PST)
Received: from localhost (2a02-842a-9b20-0d01-432b-0dab-f195-2b25.rev.sfr.net.
 [2a02:842a:9b20:d01:432b:dab:f195:2b25])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-42b53f0b894sm33875087f8f.26.2025.11.18.07.08.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Nov 2025 07:08:57 -0800 (PST)
From: =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <legoffic.clement@gmail.com>
Date: Tue, 18 Nov 2025 16:07:58 +0100
MIME-Version: 1.0
Message-Id: <20251118-b4-ddr-bindings-v9-2-a033ac5144da@gmail.com>
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
Subject: [Linux-stm32] [PATCH v9 2/7] dt-bindings: memory: introduce DDR4
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
SW50cm9kdWNlIEpFREVDIGNvbXBsaWFudCBERFIgYmluZGluZ3MsIHRoYXQgdXNlIG5ldyBtZW1v
cnktcHJvcHMgYmluZGluZy4KClRoZSBERFI0IGNvbXBhdGlibGUgY2FuIGJlIG1hZGUgb2YgZXhw
bGljaXQgdmVuZG9yIG5hbWVzIGFuZCBwYXJ0Cm51bWJlcnMgb3IgYmUgb2YgdGhlIGZvcm0gImRk
clgtWVlZWSxBQUFBLi4uLVpaIiB3aGVuIGFzc29jaWF0ZWQgd2l0aCBhbgpTUEQsIHdoZXJlIChh
Y2NvcmRpbmcgdG8gSkVERUMgU1BENC4xLjIuTC02KToKLSBZWVlZIGlzIHRoZSBtYW51ZmFjdHVy
ZXIgSUQKLSBBQUFBLi4uIGlzIHRoZSBwYXJ0IG51bWJlcgotIFpaIGlzIHRoZSByZXZpc2lvbiBJ
RAoKVGhlIGZvcm1lciBmb3JtIGlzIHVzZWZ1bCB3aGVuIHRoZSBTRFJBTSB2ZW5kb3IgYW5kIHBh
cnQgbnVtYmVyIGFyZQprbm93biwgZm9yIGV4YW1wbGUsIHdoZW4gbWVtb3J5IGlzIHNvbGRlcmVk
IG9uIHRoZSBib2FyZC4KVGhlIGxhdHRlciBmb3JtIGlzIHVzZWZ1bCB3aGVuIFNEUkFNIG5vZGVz
IGFyZSBjcmVhdGVkIGF0IHJ1bnRpbWUgYnkKYm9vdCBmaXJtd2FyZSB0aGF0IGRvZXNuJ3QgaGF2
ZSBhY2Nlc3MgdG8gc3RhdGljIHBhcnQgbnVtYmVyIGluZm9ybWF0aW9uLgoKU2lnbmVkLW9mZi1i
eTogQ2zDqW1lbnQgTGUgR29mZmljIDxjbGVtZW50LmxlZ29mZmljQGZvc3Muc3QuY29tPgpTaWdu
ZWQtb2ZmLWJ5OiBDbMOpbWVudCBMZSBHb2ZmaWMgPGxlZ29mZmljLmNsZW1lbnRAZ21haWwuY29t
PgotLS0KIC4uLi9tZW1vcnktY29udHJvbGxlcnMvZGRyL2plZGVjLGRkcjQueWFtbCAgICAgICAg
IHwgMzQgKysrKysrKysrKysrKysrKysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDM0IGluc2VydGlv
bnMoKykKCmRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbWVt
b3J5LWNvbnRyb2xsZXJzL2Rkci9qZWRlYyxkZHI0LnlhbWwgYi9Eb2N1bWVudGF0aW9uL2Rldmlj
ZXRyZWUvYmluZGluZ3MvbWVtb3J5LWNvbnRyb2xsZXJzL2Rkci9qZWRlYyxkZHI0LnlhbWwKbmV3
IGZpbGUgbW9kZSAxMDA2NDQKaW5kZXggMDAwMDAwMDAwMDAwLi45Mjg5NjFjNzQwMjYKLS0tIC9k
ZXYvbnVsbAorKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbWVtb3J5LWNv
bnRyb2xsZXJzL2Rkci9qZWRlYyxkZHI0LnlhbWwKQEAgLTAsMCArMSwzNCBAQAorIyBTUERYLUxp
Y2Vuc2UtSWRlbnRpZmllcjogKEdQTC0yLjAtb25seSBPUiBCU0QtMi1DbGF1c2UpCislWUFNTCAx
LjIKKy0tLQorJGlkOiBodHRwOi8vZGV2aWNldHJlZS5vcmcvc2NoZW1hcy9tZW1vcnktY29udHJv
bGxlcnMvZGRyL2plZGVjLGRkcjQueWFtbCMKKyRzY2hlbWE6IGh0dHA6Ly9kZXZpY2V0cmVlLm9y
Zy9tZXRhLXNjaGVtYXMvY29yZS55YW1sIworCit0aXRsZTogRERSNCBTRFJBTSBjb21wbGlhbnQg
dG8gSkVERUMgSkVTRDc5LTRECisKK21haW50YWluZXJzOgorICAtIEtyenlzenRvZiBLb3psb3dz
a2kgPGtyemtAa2VybmVsLm9yZz4KKworYWxsT2Y6CisgIC0gJHJlZjogamVkZWMsc2RyYW0tcHJv
cHMueWFtbCMKKworcHJvcGVydGllczoKKyAgY29tcGF0aWJsZToKKyAgICBpdGVtczoKKyAgICAg
IC0gcGF0dGVybjogIl5kZHI0LVswLTlhLWZdezR9LFthLXpdezEsMjB9LVswLTlhLWZdezJ9JCIK
KyAgICAgIC0gY29uc3Q6IGplZGVjLGRkcjQKKworcmVxdWlyZWQ6CisgIC0gY29tcGF0aWJsZQor
ICAtIGRlbnNpdHkKKyAgLSBpby13aWR0aAorCit1bmV2YWx1YXRlZFByb3BlcnRpZXM6IGZhbHNl
CisKK2V4YW1wbGVzOgorICAtIHwKKyAgICBkZHIgeworICAgICAgICBjb21wYXRpYmxlID0gImRk
cjQtMDBmZixhemF6LWZmIiwgImplZGVjLGRkcjQiOworICAgICAgICBkZW5zaXR5ID0gPDgxOTI+
OworICAgICAgICBpby13aWR0aCA9IDw4PjsKKyAgICB9OwoKLS0gCjIuNDMuMAoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGlu
ZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9z
dC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
