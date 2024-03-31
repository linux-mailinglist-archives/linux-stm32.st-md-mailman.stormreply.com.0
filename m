Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A0381892E53
	for <lists+linux-stm32@lfdr.de>; Sun, 31 Mar 2024 04:34:48 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4642CC6A613;
	Sun, 31 Mar 2024 02:34:48 +0000 (UTC)
Received: from mail-io1-f50.google.com (mail-io1-f50.google.com
 [209.85.166.50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CD16CC6907A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 31 Mar 2024 02:34:46 +0000 (UTC)
Received: by mail-io1-f50.google.com with SMTP id
 ca18e2360f4ac-7d0262036afso159185039f.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 30 Mar 2024 19:34:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1711852485; x=1712457285;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gV26OU7eK1E3sOOfCTy+tBkXi+05uIIvVJ+TP4hGj4w=;
 b=aCl/wRffG1a6JyN8cDXHT3gCHLh/kLw7+yybL/MYduTZskoKN1X2k3F748MlAT1fGh
 2D1ZZOFMoY6hEsKSyqCty9MjKNleg4diGCERuPSQbtX6HfjmCph3Uz8zMBDywtuHxnEL
 VFQwNVoBQrVH5fCf4YkwJZP21AHpSrTyfgNzKR5FR3/nR3jOdiW6Zu5j31eaIMMEaFGa
 1lIISsszV1GZNCI3jmeILzZwsHby1AUvp2tseVySWRtv+zNGrCO+vE8zrII5bxhA/6dN
 PVGG2NnXqGk8OVi64jSj1Iwgq9NZc7CqycW29bBLajg4mvBpdFnhHXJbX+7SQF4rOJ+r
 fEkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711852485; x=1712457285;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gV26OU7eK1E3sOOfCTy+tBkXi+05uIIvVJ+TP4hGj4w=;
 b=O2+Gz8j1YXF3WN61k8aO3OyX8xXcDbSC416qiWKV/53E28hRfinbg2+jnvdJDOBt/B
 Kpetj1+O/yjl3Wt3D+oEshwkb4xL1Hcf/9m76Qa86mpVck2euC5ionwqxJtoWgP1dRSM
 n85Pa5zIMMp3KaybVbMonoxQUj1iffKU0tz5YUrd9w1TV3KdyW2E7fkYcMVynLmTa9VI
 SymSb/7MgSeDnW6N+FeqH2s+opynu3PP9uqfO8ruBnNQMpEnQRBnlyxfjbBXWklW0AZo
 ITScqVC2F+up1+Qr0u8atafX7CP5A2esbCvHpSx+PNHEkzgxXmlBZBntSX34X8P/1EWH
 XEOg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWcHZdqKvjBTvkrQIRZTUJ7SpZoE0fTI+DRcdvFjQXRvX3m/I+OMG6DJzsIbTeJ+sXtBE2ICp7Pp7CzUkf9HeDEybV/kKKgf7Q0ablrJGxptRfuFhxbBe9L
X-Gm-Message-State: AOJu0YxrJ6rhsUmWX+4Rt441PLwGx+/vWmcb25LF9GPto7oKF6+KEkYl
 84zHyxiNxiXZW1jeHqgNVzTKSPoac8MRqSN9JIq4+/xjeUUfUn6bOsLRNih8oVl76QWgbw/27rR
 ZOmRUHRMwGRR7x5GzUB5KUvG2UA8=
X-Google-Smtp-Source: AGHT+IEUljvEWt6RLJvm0ZvDNAAvbKF98d8W07FBneubUp0ru50ICaCtTHNp6cmd+wxEi3ZRk7j/LT8mS1rRQW2OsKc=
X-Received: by 2002:a05:6e02:3710:b0:366:ab6f:f63 with SMTP id
 ck16-20020a056e02371000b00366ab6f0f63mr8646788ilb.3.1711852485494; Sat, 30
 Mar 2024 19:34:45 -0700 (PDT)
MIME-Version: 1.0
References: <CAADnVQJ_ZCzMmT1aBsNXEBFfYNSVBdBXmLocjR0PPEWtYQrQFw@mail.gmail.com>
 <CALz3k9icPePb0c4FE67q=u1U0hrePorN9gDpQrKTR_sXbLMfDA@mail.gmail.com>
 <CAADnVQLwgw8bQ7OHBbqLhcPJ2QpxiGw3fkMFur+2cjZpM_78oA@mail.gmail.com>
 <CALz3k9g9k7fEwdTZVLhrmGoXp8CE47Q+83r-AZDXrzzuR+CjVA@mail.gmail.com>
 <CAADnVQLHpi3J6cBJ0QBgCQ2aY6fWGnVvNGdfi3W-jmoa9d1eVQ@mail.gmail.com>
 <CALz3k9g-U8ih=ycJPRbyU9x_9cp00fNkU3PGQ6jP0WJ+=uKmqQ@mail.gmail.com>
 <CALz3k9jG5Jrqw=BGjt05yMkEF-1u909GbBYrV-02W0dQtm6KQQ@mail.gmail.com>
 <20240328111330.194dcbe5@gandalf.local.home>
 <CAEf4BzYgzOti+Hfdn3SUCjuofGedXRSGApVDD+K2TdG6oNE-pw@mail.gmail.com>
 <20240330082755.1cbeb8c6@rorschach.local.home> <ZghRXtc8ZiTOKMR3@krava>
In-Reply-To: <ZghRXtc8ZiTOKMR3@krava>
From: Andrii Nakryiko <andrii.nakryiko@gmail.com>
Date: Sat, 30 Mar 2024 19:34:33 -0700
Message-ID: <CAEf4BzbOAwLZ9=QnMQo-W5oHxTA7nM5ERRp0Q=WihuC8b+Y1Ww@mail.gmail.com>
To: Jiri Olsa <olsajiri@gmail.com>
Cc: "open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>,
 Dave Hansen <dave.hansen@linux.intel.com>, Alexei Starovoitov <ast@kernel.org>,
 Song Liu <song@kernel.org>, Stanislav Fomichev <sdf@google.com>,
 Yonghong Song <yonghong.song@linux.dev>,
 Alexander Gordeev <agordeev@linux.ibm.com>,
 Alexei Starovoitov <alexei.starovoitov@gmail.com>,
 linux-s390 <linux-s390@vger.kernel.org>,
 =?UTF-8?B?5qKm6b6Z6JGj?= <dongmenglong.8@bytedance.com>,
 Daniel Borkmann <daniel@iogearbox.net>, X86 ML <x86@kernel.org>,
 John Fastabend <john.fastabend@gmail.com>, Andrii Nakryiko <andrii@kernel.org>,
 linux-riscv <linux-riscv@lists.infradead.org>,
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
 bpf <bpf@vger.kernel.org>, Martin KaFai Lau <martin.lau@linux.dev>,
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

T24gU2F0LCBNYXIgMzAsIDIwMjQgYXQgMTA6NTLigK9BTSBKaXJpIE9sc2EgPG9sc2FqaXJpQGdt
YWlsLmNvbT4gd3JvdGU6Cj4KPiBPbiBTYXQsIE1hciAzMCwgMjAyNCBhdCAwODoyNzo1NUFNIC0w
NDAwLCBTdGV2ZW4gUm9zdGVkdCB3cm90ZToKPiA+IE9uIEZyaSwgMjkgTWFyIDIwMjQgMTY6Mjg6
MzMgLTA3MDAKPiA+IEFuZHJpaSBOYWtyeWlrbyA8YW5kcmlpLm5ha3J5aWtvQGdtYWlsLmNvbT4g
d3JvdGU6Cj4gPgo+ID4gPiBJIHRob3VnaHQgSSdsbCBqdXN0IGFzayBpbnN0ZWFkIG9mIGRpZ2dp
bmcgdGhyb3VnaCBjb2RlLCBzb3JyeSBmb3IKPiA+ID4gYmVpbmcgbGF6eSA6KSBJcyB0aGVyZSBh
bnkgd2F5IHRvIHBhc3MgcHRfcmVncy9mdHJhY2VfcmVncyBjYXB0dXJlZAo+ID4gPiBiZWZvcmUg
ZnVuY3Rpb24gZXhlY3V0aW9uIHRvIGEgcmV0dXJuIHByb2JlIChmZXhpdC9rcmV0cHJvYmUpPyBJ
LmUuLAo+ID4gPiBob3cgaGFyZCBpcyBpdCB0byBwYXNzIGlucHV0IGZ1bmN0aW9uIGFyZ3VtZW50
cyB0byBhIGtyZXRwcm9iZT8gVGhhdCdzCj4gPiA+IHRoZSBiaWdnZXN0IGFkdmFudGFnZSBvZiBm
ZXhpdCBvdmVyIGtyZXRwcm9iZSwgYW5kIGlmIHdlIGNhbiBtYWtlCj4gPiA+IHRoZXNlIG9yaWdp
bmFsIHB0X3JlZ3MvZnRyYWNlX3JlZ3MgYXZhaWxhYmxlIHRvIGtyZXRwcm9iZSwgdGhlbgo+ID4g
PiBtdWx0aS1rcmV0cHJvYmUgd2lsbCBlZmZlY3RpdmVseSBiZSB0aGlzIG11bHRpLWZleGl0Lgo+
ID4KPiA+IFRoaXMgc2hvdWxkIGJlIHBvc3NpYmxlIHdpdGggdGhlIHVwZGF0ZXMgdGhhdCBNYXNh
bWkgaXMgZG9pbmcgd2l0aCB0aGUKPiA+IGZncmFwaCBjb2RlLgo+Cj4geWVzLCBJIGhhdmUgYnBm
IGtwcm9iZS1tdWx0aSBsaW5rIHN1cHBvcnQgZm9yIHRoYXQgWzBdIChpdCdzIG9uIHRvcCBvZgo+
IE1hc2FtaSdzIGZwcm9iZS1vdmVyLWZncmFwaCBjaGFuZ2VzKSB3ZSBkaXNjdXNzZWQgdGhhdCBp
biBbMV0KClNvcnJ5LCBJIGZvcmdvdCB0aGUgcmVncy9hcmdzIHBhcnQsIG1vc3RseSByZW1lbWJl
cmluZyB3ZSBkaXNjdXNzZWQKc2Vzc2lvbiBjb29raWUgaWRlYXMuIFRoYW5rcyBmb3IgcmVtaW5k
ZXIhCgo+Cj4gamlya2EKPgo+IFswXSBodHRwczovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGlu
dXgva2VybmVsL2dpdC9qb2xzYS9wZXJmLmdpdC9sb2cvP2g9YnBmL3Nlc3Npb25fZGF0YQo+IFsx
XSBodHRwczovL2xvcmUua2VybmVsLm9yZy9icGYvMjAyNDAyMjgwOTAyNDIuNDA0MDIxMC0xLWpv
bHNhQGtlcm5lbC5vcmcvCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFu
LnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
