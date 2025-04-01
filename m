Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CA6FFA787A5
	for <lists+linux-stm32@lfdr.de>; Wed,  2 Apr 2025 07:49:41 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 65786C78F9A;
	Wed,  2 Apr 2025 05:49:41 +0000 (UTC)
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com
 [209.85.128.170])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C92C5C78034
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  1 Apr 2025 18:05:45 +0000 (UTC)
Received: by mail-yw1-f170.google.com with SMTP id
 00721157ae682-702599fa7c5so656237b3.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 01 Apr 2025 11:05:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1743530744; x=1744135544;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BoYrBmUYS1Fjt2+nydhXunhJyD1+jrRmHYe/TGOnFFw=;
 b=bFSosn2SD8v/8FtPbHlx2sb2WV4KCr6cQ7n8tjiy0potWQTG9ywUatCW0akkcr7bLw
 JptzKJV88Gv+7uLe0kQcy42paxZqVCYo5XkgGKWkObROOJg2BABgO0bxSD8o+XyY25DP
 0RL0jVpKkN4r7oRZIkEMVx/FaW8ER66FYAFfGqZkkY79qAP3E89CaVvXbVFQqAeA6zK1
 Vy9ELWquGCMHS3a5BBTplozNvEe34A2PA2KDi/0Cu5eMEjOlAwbwl9MAUG+Us/sf2NZb
 fc41eGQfp0w+Zb5RoZ9cUaHPd2wgBNIzVfVTSbm8sF0oGrv1D5VOUsC7VBYcoI5QtQsS
 hOsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743530744; x=1744135544;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BoYrBmUYS1Fjt2+nydhXunhJyD1+jrRmHYe/TGOnFFw=;
 b=SMzQSgxZggaa6rClL1RN8qEKNe/xOmUDTvMS0xdirn89Vj3/yqlvmLORQGD3AJif+W
 sIU1/rBN7tsDyZk8MpNvu6Q9wFJ2z6hwi/YX9G3feKACqs39m2UNDiM5TL6egfkCVYx9
 Jfd8LjXeN2WTDcalpJMjJpbkBt4iNAOuDAdr4FGoVCc+AnU7m0TchURaViN5585pPsAJ
 lbOykLFlbe0pb+3dFM6IrjXpv8pAxNEiRR6YXpXPegEzKLGFlaxogRTCkglap4J75oNR
 myVG4uxmUGKAks2aecGW1OupG+I1Y6LLeBib/HXfUiXAO70Woo8QzCVQJVEX/7++SzjC
 iMHg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXr5q18S2EcHki+aMM39qjDDXmA0H90bOiFJro64oexDF4l5KHfP2Yqzd/Z7Y6Ny4sZpRAb83CgCuaTjg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yw7ZJ91FPBkAt//nlsKyTthTlX1qGLF8RFezmSfOFy253Y6R9Ue
 TkIhw7ZJLH49mefOdY0vZxSxkK813tkjmgkY3eyXWXcYZf9cHlj03knvV7ZEhSXC6jTlRt+v4GM
 AH7wQ7KqgY9azQr61Idk2jFjrmGI=
X-Gm-Gg: ASbGncuyHiQdA0ECuFXmzsDy/rV8/MGns6ob7u+BcyDUgD8g6oRjAXRu5pcdNGvtDr4
 DdvbrSdczpGUHsMoC9kPB7Ri4V/mVthMqwNEvF7asfddy/lCDZ2Lc5glvclF62OmL4fvPORyEcw
 +0KsVogqXGuFsDZU+Kwisrn81Y3SgGKW5YvsU3IM+Q1A==
X-Google-Smtp-Source: AGHT+IGMVbGaGvOYTg9+RQ9IAGG98GOlapvtbp7KooxcYZhgqUbq/MrtYvN7WFBm50vXzage8iz9PVqJmEAJFgznsZo=
X-Received: by 2002:a05:690c:6913:b0:6f9:47ad:f5f1 with SMTP id
 00721157ae682-703b66ed874mr14693837b3.17.1743530744515; Tue, 01 Apr 2025
 11:05:44 -0700 (PDT)
MIME-Version: 1.0
References: <20250401061546.1990156-1-nichen@iscas.ac.cn>
In-Reply-To: <20250401061546.1990156-1-nichen@iscas.ac.cn>
From: Amery Hung <ameryhung@gmail.com>
Date: Tue, 1 Apr 2025 11:05:33 -0700
X-Gm-Features: AQ5f1JpOwg2Qo4yi4MGTCZ1zyArShoCogVd4mypKFbNMujca6CF07ZTLq3Qc6vY
Message-ID: <CAMB2axOa6D757_FGsW2i4xCDzNP7h+QUGMDvRtnx6EyNfjRBFA@mail.gmail.com>
To: Chen Ni <nichen@iscas.ac.cn>
X-Mailman-Approved-At: Wed, 02 Apr 2025 05:49:40 +0000
Cc: yonghong.song@linux.dev, peterz@infradead.org, linux-kernel@vger.kernel.org,
 song@kernel.org, linux-kselftest@vger.kernel.org, shuah@kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, juntong.deng@outlook.com,
 mykolal@fb.com, daniel@iogearbox.net, john.fastabend@gmail.com,
 andrii@kernel.org, sdf@fomichev.me, mcoquelin.stm32@gmail.com, ast@kernel.org,
 kpsingh@kernel.org, linux-arm-kernel@lists.infradead.org, haoluo@google.com,
 oleg@redhat.com, eddyz87@gmail.com, jolsa@kernel.org, bpf@vger.kernel.org,
 martin.lau@linux.dev
Subject: Re: [Linux-stm32] [PATCH] selftests/bpf: Convert comma to semicolon
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

T24gTW9uLCBNYXIgMzEsIDIwMjUgYXQgMTE6MTfigK9QTSBDaGVuIE5pIDxuaWNoZW5AaXNjYXMu
YWMuY24+IHdyb3RlOgo+Cj4gUmVwbGFjZSBjb21tYSBiZXR3ZWVuIGV4cHJlc3Npb25zIHdpdGgg
c2VtaWNvbG9ucy4KPgo+IFVzaW5nIGEgJywnIGluIHBsYWNlIG9mIGEgJzsnIGNhbiBoYXZlIHVu
aW50ZW5kZWQgc2lkZSBlZmZlY3RzLgo+IEFsdGhvdWdoIHRoYXQgaXMgbm90IHRoZSBjYXNlIGhl
cmUsIGl0IGlzIHNlZW1zIGJlc3QgdG8gdXNlICc7Jwo+IHVubGVzcyAnLCcgaXMgaW50ZW5kZWQu
Cj4KPiBGb3VuZCBieSBpbnNwZWN0aW9uLgo+IE5vIGZ1bmN0aW9uYWwgY2hhbmdlIGludGVuZGVk
Lgo+IENvbXBpbGUgdGVzdGVkIG9ubHkuCj4KCk9vcHNpZS4gVGhhbmtzIGZvciBmaXhpbmcgaXQu
CgpSZXZpZXdlZC1ieTogQW1lcnkgSHVuZyA8YW1lcnlodW5nQGdtYWlsLmNvbT4KCj4gU2lnbmVk
LW9mZi1ieTogQ2hlbiBOaSA8bmljaGVuQGlzY2FzLmFjLmNuPgo+IC0tLQo+ICB0b29scy90ZXN0
aW5nL3NlbGZ0ZXN0cy9icGYvdGVzdF9rbW9kcy9icGZfdGVzdG1vZC5jIHwgNCArKy0tCj4gIDEg
ZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCj4KPiBkaWZmIC0t
Z2l0IGEvdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMvYnBmL3Rlc3Rfa21vZHMvYnBmX3Rlc3Rtb2Qu
YyBiL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2JwZi90ZXN0X2ttb2RzL2JwZl90ZXN0bW9kLmMK
PiBpbmRleCAzMjIwZjFkMjg2OTcuLmYzOGVhZjBkMzVlZiAxMDA2NDQKPiAtLS0gYS90b29scy90
ZXN0aW5nL3NlbGZ0ZXN0cy9icGYvdGVzdF9rbW9kcy9icGZfdGVzdG1vZC5jCj4gKysrIGIvdG9v
bHMvdGVzdGluZy9zZWxmdGVzdHMvYnBmL3Rlc3Rfa21vZHMvYnBmX3Rlc3Rtb2QuYwo+IEBAIC0x
MzQwLDcgKzEzNDAsNyBAQCBzdGF0aWMgaW50IHN0X29wc19nZW5fcHJvbG9ndWVfd2l0aF9rZnVu
YyhzdHJ1Y3QgYnBmX2luc24gKmluc25fYnVmLCBib29sIGRpcmVjdAo+ICAgICAgICAgKmluc24r
KyA9IEJQRl9TVFhfTUVNKEJQRl9EVywgQlBGX1JFR182LCBCUEZfUkVHXzcsIG9mZnNldG9mKHN0
cnVjdCBzdF9vcHNfYXJncywgYSkpOwo+ICAgICAgICAgKmluc24rKyA9IEJQRl9KTVBfSU1NKEJQ
Rl9KQSwgMCwgMCwgMik7Cj4gICAgICAgICAqaW5zbisrID0gQlBGX01PVjY0X1JFRyhCUEZfUkVH
XzEsIEJQRl9SRUdfMCk7Cj4gLSAgICAgICAqaW5zbisrID0gQlBGX0NBTExfS0ZVTkMoMCwgYnBm
X2Nncm91cF9yZWxlYXNlX2lkKSwKPiArICAgICAgICppbnNuKysgPSBCUEZfQ0FMTF9LRlVOQygw
LCBicGZfY2dyb3VwX3JlbGVhc2VfaWQpOwo+ICAgICAgICAgKmluc24rKyA9IEJQRl9NT1Y2NF9S
RUcoQlBGX1JFR18xLCBCUEZfUkVHXzgpOwo+ICAgICAgICAgKmluc24rKyA9IHByb2ctPmluc25z
aVswXTsKPgo+IEBAIC0xMzc5LDcgKzEzNzksNyBAQCBzdGF0aWMgaW50IHN0X29wc19nZW5fZXBp
bG9ndWVfd2l0aF9rZnVuYyhzdHJ1Y3QgYnBmX2luc24gKmluc25fYnVmLCBjb25zdCBzdHJ1Ywo+
ICAgICAgICAgKmluc24rKyA9IEJQRl9TVFhfTUVNKEJQRl9EVywgQlBGX1JFR18xLCBCUEZfUkVH
XzYsIG9mZnNldG9mKHN0cnVjdCBzdF9vcHNfYXJncywgYSkpOwo+ICAgICAgICAgKmluc24rKyA9
IEJQRl9KTVBfSU1NKEJQRl9KQSwgMCwgMCwgMik7Cj4gICAgICAgICAqaW5zbisrID0gQlBGX01P
VjY0X1JFRyhCUEZfUkVHXzEsIEJQRl9SRUdfMCk7Cj4gLSAgICAgICAqaW5zbisrID0gQlBGX0NB
TExfS0ZVTkMoMCwgYnBmX2Nncm91cF9yZWxlYXNlX2lkKSwKPiArICAgICAgICppbnNuKysgPSBC
UEZfQ0FMTF9LRlVOQygwLCBicGZfY2dyb3VwX3JlbGVhc2VfaWQpOwo+ICAgICAgICAgKmluc24r
KyA9IEJQRl9NT1Y2NF9SRUcoQlBGX1JFR18wLCBCUEZfUkVHXzYpOwo+ICAgICAgICAgKmluc24r
KyA9IEJQRl9BTFU2NF9JTU0oQlBGX01VTCwgQlBGX1JFR18wLCAyKTsKPiAgICAgICAgICppbnNu
KysgPSBCUEZfRVhJVF9JTlNOKCk7Cj4gLS0KPiAyLjI1LjEKPgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGlu
dXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxt
YW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
