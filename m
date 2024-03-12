Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 62BCF878CC1
	for <lists+linux-stm32@lfdr.de>; Tue, 12 Mar 2024 03:09:38 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1754DC6DD9D;
	Tue, 12 Mar 2024 02:09:38 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com
 [209.85.221.45])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E8785C6DD73
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 12 Mar 2024 02:09:36 +0000 (UTC)
Received: by mail-wr1-f45.google.com with SMTP id
 ffacd0b85a97d-33e899ce9e3so1803331f8f.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 11 Mar 2024 19:09:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1710209376; x=1710814176;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=O7OazjLh3TJZJaBxgYhNmL2BYNu/aO7IPEXCMBRgvJk=;
 b=VA1U+FnCWneqswRkohFXhPubJ653JpBU1iqvlSib5Ok04bwbPOVr0MVWh9MEqkGNUx
 PNgiyChaXx5RQFConb0Yyg7w/rZ8ezZ2h73jbe1+n81zcHJddVYy+U/TxlYN2/RvLqkJ
 NKJZNST0fUYD3FqACWvKGvS1x1Sv/PuddYd6lEbmj35w2hdd+Lq6o7LxXrlQe2foJzBA
 Fw9ouNJW6PCq9B+O3tCeSpYD1bxzR/qNnKu1tWid4h6avc49hD6FwIgi30UkIOqDVob6
 /qMPVdiScv0SXWVlAtXi4EjPNEgYzZpVyk3BkWfm/hgwuNPINpwAWFaJdm+NIqCpg0p2
 5/6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710209376; x=1710814176;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=O7OazjLh3TJZJaBxgYhNmL2BYNu/aO7IPEXCMBRgvJk=;
 b=jb2iWWqw1Efmlr13FBkpRk/FA0YaiM/bgHxd58MrU1extktZQIGUQNVyPCqfRfTr1P
 9t6jRo/xs1gxKb6gtT2902847aaaZTivO9qVU7W8owbGNRDNdX2dM2bnqYFPLSCZ7kzN
 vJAPR2wJTuJofhp6zU6nkS9FF/VxjdqmR1oCXjkp9Bi2XZKdR0aLUYlR7LfMbmHx53C+
 elsjxPOzIfocMvaTxWNPn4U0DaOnp2tSAFNcpUXIOp+4Y9LcLAIXqwpS9mwyQOSLK71b
 p01FziMj3cthZB4OV6nfuUcnxEb7oWDXyVU7y7uXDczrsGrwatczBYXoSRmdQn9Xe33N
 IDpw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWSzsGLmXh1qe0hCvCw+csDkaNKZ0Jk/j58XGbvQknmZ8KAiaALEQE7Oix8WjLl/VWCS82bkugkHwSzhLsqMinMezMBpiDy6/yg6oNdA88LK3QMKxRu+1Lz
X-Gm-Message-State: AOJu0YwEZtEvHyOmBXL6/yyp85PDj/AUcpxyf1OzghtefEX5gHrEgkas
 m4QJhUfikGLQWlxAHj393IZtKu5c4LB8j0BUuStUAdRKtv0UkKYr+NK/b187rP3imuVRo885H4D
 6IrasKIOUHywBGarWIijcH0cRe+E=
X-Google-Smtp-Source: AGHT+IEicWbuFZqdg/xqQNzdGQlw9skotEo3jcZk3zVibmZ6sCWBpxxOKUqsLebol1eFrvMKXlFvA4Sc4ycQD3B2uCo=
X-Received: by 2002:a5d:424d:0:b0:33e:7adc:516c with SMTP id
 s13-20020a5d424d000000b0033e7adc516cmr5003733wrr.57.1710209376134; Mon, 11
 Mar 2024 19:09:36 -0700 (PDT)
MIME-Version: 1.0
References: <20240311093526.1010158-1-dongmenglong.8@bytedance.com>
 <20240311093526.1010158-2-dongmenglong.8@bytedance.com>
 <CAADnVQKQPS5NcvEouH4JqZ2fKgQAC+LtcwhX9iXYoiEkF_M94Q@mail.gmail.com>
 <CALz3k9i5G5wWi+rtvHPwVLOUAXVMCiU_8QUZs87TEYgR_0wpPA@mail.gmail.com>
In-Reply-To: <CALz3k9i5G5wWi+rtvHPwVLOUAXVMCiU_8QUZs87TEYgR_0wpPA@mail.gmail.com>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Mon, 11 Mar 2024 19:09:25 -0700
Message-ID: <CAADnVQJ_ZCzMmT1aBsNXEBFfYNSVBdBXmLocjR0PPEWtYQrQFw@mail.gmail.com>
To: =?UTF-8?B?5qKm6b6Z6JGj?= <dongmenglong.8@bytedance.com>
Cc: "open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>,
 Dave Hansen <dave.hansen@linux.intel.com>, Alexei Starovoitov <ast@kernel.org>,
 Song Liu <song@kernel.org>, Stanislav Fomichev <sdf@google.com>,
 Yonghong Song <yonghong.song@linux.dev>,
 Alexander Gordeev <agordeev@linux.ibm.com>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 linux-s390 <linux-s390@vger.kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>, X86 ML <x86@kernel.org>,
 John Fastabend <john.fastabend@gmail.com>, Andrii Nakryiko <andrii@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com,
 Quentin Monnet <quentin@isovalent.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 linux-trace-kernel@vger.kernel.org, Steven Rostedt <rostedt@goodmis.org>,
 KP Singh <kpsingh@kernel.org>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 Hao Luo <haoluo@google.com>, Network Development <netdev@vger.kernel.org>,
 David Ahern <dsahern@kernel.org>, LKML <linux-kernel@vger.kernel.org>,
 Eddy Z <eddyz87@gmail.com>, Sven Schnelle <svens@linux.ibm.com>,
 Jiri Olsa <jolsa@kernel.org>, bpf <bpf@vger.kernel.org>,
 Martin KaFai Lau <martin.lau@linux.dev>,
 "David S. Miller" <davem@davemloft.net>
Subject: Re: [Linux-stm32] [External] Re: [PATCH bpf-next v2 1/9] bpf:
 tracing: add support to record and check the accessed args
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

T24gTW9uLCBNYXIgMTEsIDIwMjQgYXQgNzowMeKAr1BNIOaipum+meiRoyA8ZG9uZ21lbmdsb25n
LjhAYnl0ZWRhbmNlLmNvbT4gd3JvdGU6Cj4KPiBPbiBUdWUsIE1hciAxMiwgMjAyNCBhdCA5OjQ2
4oCvQU0gQWxleGVpIFN0YXJvdm9pdG92Cj4gPGFsZXhlaS5zdGFyb3ZvaXRvdkBnbWFpbC5jb20+
IHdyb3RlOgo+ID4KPiA+IE9uIE1vbiwgTWFyIDExLCAyMDI0IGF0IDI6MzTigK9BTSBNZW5nbG9u
ZyBEb25nCj4gPiA8ZG9uZ21lbmdsb25nLjhAYnl0ZWRhbmNlLmNvbT4gd3JvdGU6Cj4gPiA+Cj4g
PiA+IEluIHRoaXMgY29tbWl0LCB3ZSBhZGQgdGhlICdhY2Nlc3NlZF9hcmdzJyBmaWVsZCB0byBz
dHJ1Y3QgYnBmX3Byb2dfYXV4LAo+ID4gPiB3aGljaCBpcyB1c2VkIHRvIHJlY29yZCB0aGUgYWNj
ZXNzZWQgaW5kZXggb2YgdGhlIGZ1bmN0aW9uIGFyZ3MgaW4KPiA+ID4gYnRmX2N0eF9hY2Nlc3Mo
KS4KPiA+ID4KPiA+ID4gTWVhbndoaWxlLCB3ZSBhZGQgdGhlIGZ1bmN0aW9uIGJ0Zl9jaGVja19m
dW5jX3BhcnRfbWF0Y2goKSB0byBjb21wYXJlIHRoZQo+ID4gPiBhY2Nlc3NlZCBmdW5jdGlvbiBh
cmdzIG9mIHR3byBmdW5jdGlvbiBwcm90b3R5cGUuIFRoaXMgZnVuY3Rpb24gd2lsbCBiZQo+ID4g
PiB1c2VkIGluIHRoZSBmb2xsb3dpbmcgY29tbWl0Lgo+ID4gPgo+ID4gPiBTaWduZWQtb2ZmLWJ5
OiBNZW5nbG9uZyBEb25nIDxkb25nbWVuZ2xvbmcuOEBieXRlZGFuY2UuY29tPgo+ID4gPiAtLS0K
PiA+ID4gIGluY2x1ZGUvbGludXgvYnBmLmggfCAgIDQgKysKPiA+ID4gIGtlcm5lbC9icGYvYnRm
LmMgICAgfCAxMDggKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKy0K
PiA+ID4gIDIgZmlsZXMgY2hhbmdlZCwgMTEwIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0p
Cj4gPiA+Cj4gPiA+IGRpZmYgLS1naXQgYS9pbmNsdWRlL2xpbnV4L2JwZi5oIGIvaW5jbHVkZS9s
aW51eC9icGYuaAo+ID4gPiBpbmRleCA5NWUwNzY3M2NkYzEuLjBmNjc3ZmRjZmNjNyAxMDA2NDQK
PiA+ID4gLS0tIGEvaW5jbHVkZS9saW51eC9icGYuaAo+ID4gPiArKysgYi9pbmNsdWRlL2xpbnV4
L2JwZi5oCj4gPiA+IEBAIC0xNDYxLDYgKzE0NjEsNyBAQCBzdHJ1Y3QgYnBmX3Byb2dfYXV4IHsK
PiA+ID4gICAgICAgICBjb25zdCBzdHJ1Y3QgYnRmX3R5cGUgKmF0dGFjaF9mdW5jX3Byb3RvOwo+
ID4gPiAgICAgICAgIC8qIGZ1bmN0aW9uIG5hbWUgZm9yIHZhbGlkIGF0dGFjaF9idGZfaWQgKi8K
PiA+ID4gICAgICAgICBjb25zdCBjaGFyICphdHRhY2hfZnVuY19uYW1lOwo+ID4gPiArICAgICAg
IHU2NCBhY2Nlc3NlZF9hcmdzOwo+ID4gPiAgICAgICAgIHN0cnVjdCBicGZfcHJvZyAqKmZ1bmM7
Cj4gPiA+ICAgICAgICAgdm9pZCAqaml0X2RhdGE7IC8qIEpJVCBzcGVjaWZpYyBkYXRhLiBhcmNo
IGRlcGVuZGVudCAqLwo+ID4gPiAgICAgICAgIHN0cnVjdCBicGZfaml0X3Bva2VfZGVzY3JpcHRv
ciAqcG9rZV90YWI7Cj4gPiA+IEBAIC0yNTY1LDYgKzI1NjYsOSBAQCBzdHJ1Y3QgYnBmX3JlZ19z
dGF0ZTsKPiA+ID4gIGludCBidGZfcHJlcGFyZV9mdW5jX2FyZ3Moc3RydWN0IGJwZl92ZXJpZmll
cl9lbnYgKmVudiwgaW50IHN1YnByb2cpOwo+ID4gPiAgaW50IGJ0Zl9jaGVja190eXBlX21hdGNo
KHN0cnVjdCBicGZfdmVyaWZpZXJfbG9nICpsb2csIGNvbnN0IHN0cnVjdCBicGZfcHJvZyAqcHJv
ZywKPiA+ID4gICAgICAgICAgICAgICAgICAgICAgICAgIHN0cnVjdCBidGYgKmJ0ZiwgY29uc3Qg
c3RydWN0IGJ0Zl90eXBlICp0KTsKPiA+ID4gK2ludCBidGZfY2hlY2tfZnVuY19wYXJ0X21hdGNo
KHN0cnVjdCBidGYgKmJ0ZjEsIGNvbnN0IHN0cnVjdCBidGZfdHlwZSAqdDEsCj4gPiA+ICsgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIHN0cnVjdCBidGYgKmJ0ZjIsIGNvbnN0IHN0cnVjdCBi
dGZfdHlwZSAqdDIsCj4gPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHU2NCBmdW5j
X2FyZ3MpOwo+ID4gPiAgY29uc3QgY2hhciAqYnRmX2ZpbmRfZGVjbF90YWdfdmFsdWUoY29uc3Qg
c3RydWN0IGJ0ZiAqYnRmLCBjb25zdCBzdHJ1Y3QgYnRmX3R5cGUgKnB0LAo+ID4gPiAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICBpbnQgY29tcF9pZHgsIGNvbnN0IGNoYXIgKnRh
Z19rZXkpOwo+ID4gPiAgaW50IGJ0Zl9maW5kX25leHRfZGVjbF90YWcoY29uc3Qgc3RydWN0IGJ0
ZiAqYnRmLCBjb25zdCBzdHJ1Y3QgYnRmX3R5cGUgKnB0LAo+ID4gPiBkaWZmIC0tZ2l0IGEva2Vy
bmVsL2JwZi9idGYuYyBiL2tlcm5lbC9icGYvYnRmLmMKPiA+ID4gaW5kZXggMTcwZDAxN2U4ZTRh
Li5jMmEwMjk5ZDQzNTggMTAwNjQ0Cj4gPiA+IC0tLSBhL2tlcm5lbC9icGYvYnRmLmMKPiA+ID4g
KysrIGIva2VybmVsL2JwZi9idGYuYwo+ID4gPiBAQCAtNjEyNSwxOSArNjEyNSwyNCBAQCBzdGF0
aWMgYm9vbCBpc19pbnRfcHRyKHN0cnVjdCBidGYgKmJ0ZiwgY29uc3Qgc3RydWN0IGJ0Zl90eXBl
ICp0KQo+ID4gPiAgfQo+ID4gPgo+ID4gPiAgc3RhdGljIHUzMiBnZXRfY3R4X2FyZ19pZHgoc3Ry
dWN0IGJ0ZiAqYnRmLCBjb25zdCBzdHJ1Y3QgYnRmX3R5cGUgKmZ1bmNfcHJvdG8sCj4gPiA+IC0g
ICAgICAgICAgICAgICAgICAgICAgICAgIGludCBvZmYpCj4gPiA+ICsgICAgICAgICAgICAgICAg
ICAgICAgICAgIGludCBvZmYsIGludCAqYWxpZ25lZF9pZHgpCj4gPiA+ICB7Cj4gPiA+ICAgICAg
ICAgY29uc3Qgc3RydWN0IGJ0Zl9wYXJhbSAqYXJnczsKPiA+ID4gICAgICAgICBjb25zdCBzdHJ1
Y3QgYnRmX3R5cGUgKnQ7Cj4gPiA+ICAgICAgICAgdTMyIG9mZnNldCA9IDAsIG5yX2FyZ3M7Cj4g
PiA+ICAgICAgICAgaW50IGk7Cj4gPiA+Cj4gPiA+ICsgICAgICAgaWYgKGFsaWduZWRfaWR4KQo+
ID4gPiArICAgICAgICAgICAgICAgKmFsaWduZWRfaWR4ID0gLUVOT0VOVDsKPiA+ID4gKwo+ID4g
PiAgICAgICAgIGlmICghZnVuY19wcm90bykKPiA+ID4gICAgICAgICAgICAgICAgIHJldHVybiBv
ZmYgLyA4Owo+ID4gPgo+ID4gPiAgICAgICAgIG5yX2FyZ3MgPSBidGZfdHlwZV92bGVuKGZ1bmNf
cHJvdG8pOwo+ID4gPiAgICAgICAgIGFyZ3MgPSAoY29uc3Qgc3RydWN0IGJ0Zl9wYXJhbSAqKShm
dW5jX3Byb3RvICsgMSk7Cj4gPiA+ICAgICAgICAgZm9yIChpID0gMDsgaSA8IG5yX2FyZ3M7IGkr
Kykgewo+ID4gPiArICAgICAgICAgICAgICAgaWYgKGFsaWduZWRfaWR4ICYmIG9mZnNldCA9PSBv
ZmYpCj4gPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICphbGlnbmVkX2lkeCA9IGk7Cj4gPiA+
ICAgICAgICAgICAgICAgICB0ID0gYnRmX3R5cGVfc2tpcF9tb2RpZmllcnMoYnRmLCBhcmdzW2ld
LnR5cGUsIE5VTEwpOwo+ID4gPiAgICAgICAgICAgICAgICAgb2Zmc2V0ICs9IGJ0Zl90eXBlX2lz
X3B0cih0KSA/IDggOiByb3VuZHVwKHQtPnNpemUsIDgpOwo+ID4gPiAgICAgICAgICAgICAgICAg
aWYgKG9mZiA8IG9mZnNldCkKPiA+ID4gQEAgLTYyMDcsNyArNjIxMiw3IEBAIGJvb2wgYnRmX2N0
eF9hY2Nlc3MoaW50IG9mZiwgaW50IHNpemUsIGVudW0gYnBmX2FjY2Vzc190eXBlIHR5cGUsCj4g
PiA+ICAgICAgICAgICAgICAgICAgICAgICAgIHRuYW1lLCBvZmYpOwo+ID4gPiAgICAgICAgICAg
ICAgICAgcmV0dXJuIGZhbHNlOwo+ID4gPiAgICAgICAgIH0KPiA+ID4gLSAgICAgICBhcmcgPSBn
ZXRfY3R4X2FyZ19pZHgoYnRmLCB0LCBvZmYpOwo+ID4gPiArICAgICAgIGFyZyA9IGdldF9jdHhf
YXJnX2lkeChidGYsIHQsIG9mZiwgTlVMTCk7Cj4gPiA+ICAgICAgICAgYXJncyA9IChjb25zdCBz
dHJ1Y3QgYnRmX3BhcmFtICopKHQgKyAxKTsKPiA+ID4gICAgICAgICAvKiBpZiAodCA9PSBOVUxM
KSBGYWxsIGJhY2sgdG8gZGVmYXVsdCBCUEYgcHJvZyB3aXRoCj4gPiA+ICAgICAgICAgICogTUFY
X0JQRl9GVU5DX1JFR19BUkdTIHU2NCBhcmd1bWVudHMuCj4gPiA+IEBAIC02MjE3LDYgKzYyMjIs
OSBAQCBib29sIGJ0Zl9jdHhfYWNjZXNzKGludCBvZmYsIGludCBzaXplLCBlbnVtIGJwZl9hY2Nl
c3NfdHlwZSB0eXBlLAo+ID4gPiAgICAgICAgICAgICAgICAgLyogc2tpcCBmaXJzdCAndm9pZCAq
X19kYXRhJyBhcmd1bWVudCBpbiBidGZfdHJhY2VfIyNuYW1lIHR5cGVkZWYgKi8KPiA+ID4gICAg
ICAgICAgICAgICAgIGFyZ3MrKzsKPiA+ID4gICAgICAgICAgICAgICAgIG5yX2FyZ3MtLTsKPiA+
ID4gKyAgICAgICAgICAgICAgIHByb2ctPmF1eC0+YWNjZXNzZWRfYXJncyB8PSAoMSA8PCAoYXJn
ICsgMSkpOwo+ID4gPiArICAgICAgIH0gZWxzZSB7Cj4gPiA+ICsgICAgICAgICAgICAgICBwcm9n
LT5hdXgtPmFjY2Vzc2VkX2FyZ3MgfD0gKDEgPDwgYXJnKTsKPiA+Cj4gPiBXaGF0IGRvIHlvdSBu
ZWVkIHRoaXMgYWxpZ25lZF9pZHggZm9yID8KPiA+IEknZCBleHBlY3QgdGhhdCBhYm92ZSAiYWNj
ZXNzZWRfYXJncyB8PSAoMSA8PCBhcmcpOyIgaXMgZW5vdWdoLgo+ID4KPgo+IFdoaWNoIGFsaWdu
ZWRfaWR4PyBObyBhbGlnbmVkX2lkeCBpbiB0aGUgYnRmX2N0eF9hY2Nlc3MoKSwgYW5kCj4gYWxp
Z25lZF9pZHggaXMgb25seSB1c2VkIGluIHRoZSBidGZfY2hlY2tfZnVuY19wYXJ0X21hdGNoKCku
Cj4KPiBJbiB0aGUgYnRmX2NoZWNrX2Z1bmNfcGFydF9tYXRjaCgpLCBJIG5lZWQgdG8gY29tcGFy
ZSB0aGUKPiB0MS0+YXJnc1tpXSBhbmQgdDItPmFyZ3Nbal0sIHdoaWNoIGhhdmUgdGhlIHNhbWUg
b2Zmc2V0LiBBbmQKPiB0aGUgYWxpZ25lZF9pZHggaXMgdG8gZmluZCB0aGUgImoiIGFjY29yZGlu
ZyB0byB0aGUgb2Zmc2V0IG9mCj4gdDEtPmFyZ3NbaV0uCgpBbmQgdGhhdCdzIG15IHF1ZXN0aW9u
LgpXaHkgeW91IGRvbid0IGRvIHRoZSBtYXggb2YgYWNjZXNzZWRfYXJncyBhY3Jvc3MgYWxsIGF0
dGFjaApwb2ludHMgYW5kIGRvIGJ0Zl9jaGVja19mdW5jX3R5cGVfbWF0Y2goKSB0byB0aGF0IGFy
Z25vCmluc3RlYWQgb2YgbmFyZ3MxLgpUaGlzICdvZmZzZXQgKz0gYnRmX3R5cGVfaXNfcHRyKHQx
KSA/IDggOiByb3VuZHVwLi4uCmlzIG9kZC4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0
LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVw
bHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
