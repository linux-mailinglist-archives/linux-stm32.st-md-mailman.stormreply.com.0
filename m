Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9741E8932D2
	for <lists+linux-stm32@lfdr.de>; Sun, 31 Mar 2024 18:28:37 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 41F29C6C820;
	Sun, 31 Mar 2024 16:28:37 +0000 (UTC)
Received: from a.mx.secunet.com (a.mx.secunet.com [62.96.220.36])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1AE6CC6B476
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 31 Mar 2024 16:28:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by a.mx.secunet.com (Postfix) with ESMTP id 7A99D208CC;
 Sun, 31 Mar 2024 18:28:35 +0200 (CEST)
X-Virus-Scanned: by secunet
Received: from a.mx.secunet.com ([127.0.0.1])
 by localhost (a.mx.secunet.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XLDP8ZuhwHNz; Sun, 31 Mar 2024 18:28:34 +0200 (CEST)
Received: from mailout2.secunet.com (mailout2.secunet.com [62.96.220.49])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by a.mx.secunet.com (Postfix) with ESMTPS id F382B208D6;
 Sun, 31 Mar 2024 18:28:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 a.mx.secunet.com F382B208D6
Received: from cas-essen-01.secunet.de (unknown [10.53.40.201])
 by mailout2.secunet.com (Postfix) with ESMTP id E4237800057;
 Sun, 31 Mar 2024 18:28:30 +0200 (CEST)
Received: from mbx-essen-01.secunet.de (10.53.40.197) by
 cas-essen-01.secunet.de (10.53.40.201) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Sun, 31 Mar 2024 18:28:30 +0200
Received: from Pickup by mbx-essen-01.secunet.de with Microsoft SMTP Server id
 15.1.2507.17; Sun, 31 Mar 2024 16:23:59 +0000
X-sender: <netdev+bounces-83537-peter.schumann=secunet.com@vger.kernel.org>
X-Receiver: <peter.schumann@secunet.com>
 ORCPT=rfc822;peter.schumann@secunet.com NOTIFY=NEVER;
 X-ExtendedProps=BQAVABYAAgAAAAUAFAARAJ05ab4WgQhHsqdZ7WUjHykPADUAAABNaWNyb3NvZnQuRXhjaGFuZ2UuVHJhbnNwb3J0LkRpcmVjdG9yeURhdGEuSXNSZXNvdXJjZQIAAAUAagAJAAEAAAAAAAAABQAWAAIAAAUAQwACAAAFAEYABwADAAAABQBHAAIAAAUAEgAPAGAAAAAvbz1zZWN1bmV0L291PUV4Y2hhbmdlIEFkbWluaXN0cmF0aXZlIEdyb3VwIChGWURJQk9IRjIzU1BETFQpL2NuPVJlY2lwaWVudHMvY249UGV0ZXIgU2NodW1hbm41ZTcFAAsAFwC+AAAAQ5IZ35DtBUiRVnd98bETxENOPURCNCxDTj1EYXRhYmFzZXMsQ049RXhjaGFuZ2UgQWRtaW5pc3RyYXRpdmUgR3JvdXAgKEZZRElCT0hGMjNTUERMVCksQ049QWRtaW5pc3RyYXRpdmUgR3JvdXBzLENOPXNlY3VuZXQsQ049TWljcm9zb2Z0IEV4Y2hhbmdlLENOPVNlcnZpY2VzLENOPUNvbmZpZ3VyYXRpb24sREM9c2VjdW5ldCxEQz1kZQUADgARAC7JU/le071Fhs0mWv1VtVsFAB0ADwAMAAAAbWJ4LWVzc2VuLTAxBQA8AAIAAA8ANgAAAE1pY3Jvc29mdC5FeGNoYW5nZS5UcmFuc3BvcnQuTWFpbFJlY2lwaWVudC5EaXNwbGF5TmFtZQ8ADwAAAFNjaHVtYW5uLCBQZXRlcgUADAACAAAFAGwAAgAABQBYABcASAAAAJ05ab4WgQhHsqdZ7WUjHylDTj1TY2h1bWFubiBQZXRlcixPVT1Vc2VycyxPVT1NaWdyYXRpb24sREM9c2VjdW5ldCxEQz1kZQUAJgACAAEFACIADwAxAAAAQXV0b1Jlc3BvbnNlU3VwcHJlc3M6IDANClRyYW5zbWl0SGlzdG9yeTogRmFsc
 2UNCg8ALwAAAE1pY3Jvc29mdC5FeGNoYW5nZS5UcmFuc3BvcnQuRXhwYW5zaW9uR3JvdXBUeXBlDwAVAAAATWVtYmVyc0dyb3VwRXhwYW5zaW9uBQAjAAIAAQ==
X-CreatedBy: MSExchange15
X-HeloDomain: b.mx.secunet.com
X-ExtendedProps: BQBjAAoAwapAQuxQ3AgFAGEACAABAAAABQA3AAIAAA8APAAAAE1pY3Jvc29mdC5FeGNoYW5nZS5UcmFuc3BvcnQuTWFpbFJlY2lwaWVudC5Pcmdhbml6YXRpb25TY29wZREAAAAAAAAAAAAAAAAAAAAAAAUASQACAAEFAGIACgBrAAAAqIoAAAUABAAUIAEAAAAaAAAAcGV0ZXIuc2NodW1hbm5Ac2VjdW5ldC5jb20FAAYAAgABBQApAAIAAQ8ACQAAAENJQXVkaXRlZAIAAQUAAgAHAAEAAAAFAAMABwAAAAAABQAFAAIAAQUAZAAPAAMAAABIdWI=
X-Source: SMTP:Default MBX-DRESDEN-01
X-SourceIPAddress: 62.96.220.37
X-EndOfInjectedXHeaders: 17473
X-Virus-Scanned: by secunet
Received-SPF: Pass (sender SPF authorized) identity=mailfrom;
 client-ip=147.75.199.223; helo=ny.mirrors.kernel.org;
 envelope-from=netdev+bounces-83537-peter.schumann=secunet.com@vger.kernel.org;
 receiver=peter.schumann@secunet.com 
DKIM-Filter: OpenDKIM Filter v2.11.0 b.mx.secunet.com 8423120199
Authentication-Results: b.mx.secunet.com;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="Jy2AymGs"
Authentication-Results: smtp.subspace.kernel.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="Jy2AymGs"
X-Original-To: netdev@vger.kernel.org
Authentication-Results: smtp.subspace.kernel.org;
 arc=none smtp.client-ip=209.85.166.50
ARC-Seal: i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
 t=1711852487; cv=none;
 b=jWMqKNBstHic1NnNqtmEhklFX98fH400WfQDTFyqhKjtIXY7tRb0YqsOvtGOZyXx0wEWKPJAKd86o+m1j+A6/1WE8pCEXzgUX6SKfC6W0ezZ25Rzsz2fAVlUyUeM5EEuntcuT+ehdeWbAQcf77zyAw8axusWoE4oQeU/ECfd/vE=
ARC-Message-Signature: i=1; a=rsa-sha256; d=subspace.kernel.org;
 s=arc-20240116; t=1711852487; c=relaxed/simple;
 bh=gV26OU7eK1E3sOOfCTy+tBkXi+05uIIvVJ+TP4hGj4w=;
 h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
 To:Cc:Content-Type;
 b=QmzYeAGSaMyIjDZPlrwMo3hgPPsMOffRH8URPmCTR8dQMZhq7GO//lFDYMSk6tPcMuQTRTFRf2OrVj1ugqK0lxJM3vFBFuu/N7HMnZBcdqNyXGtnkhCp/notTFUWHOF2ByvyVCUhghBbJ/tO3SGu2dV2uOZN7pwqyGJffONCsRk=
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com;
 spf=pass smtp.mailfrom=gmail.com;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b=Jy2AymGs; arc=none smtp.client-ip=209.85.166.50
Authentication-Results: smtp.subspace.kernel.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
 spf=pass smtp.mailfrom=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1711852485; x=1712457285; darn=vger.kernel.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gV26OU7eK1E3sOOfCTy+tBkXi+05uIIvVJ+TP4hGj4w=;
 b=Jy2AymGsN5lMSc1UzWBQqYEmctJu9hcEFMrLk1EvVIPUQ2vRWGvrki52sw7v23NLNy
 PJRpVeNV/9llTQ9/EMyMHfhE3PGEFhw1ToIkfDHcu4G1MtDeAmPMGmvoQVD2ytyOBfP9
 1k2Xm1jfRY4gUYOSigq2OoU+Ho3HoOiPnoIQxo10pvq1GTvxA/OcXA+fq6TRplYNpRAp
 fdai6ZVFdNN0dNmPdfkij0KZIsOnGnXl0Cln4cRXfOqX51cSkigiXGyKO4QieVXSKSXV
 CUYMuTkl3aX2Q2MAX4cEY+tEewnezwTFzF6/t0lpTHAi4cbvhL5i75u/2uT5rVPpvl4n
 4IGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711852485; x=1712457285;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gV26OU7eK1E3sOOfCTy+tBkXi+05uIIvVJ+TP4hGj4w=;
 b=rdUmY+KCUxxZt/KqUHDvByexlAZtEIH4XrbOIIDE9I6XBIVvHCTPgiV21Nr3oWYET5
 4yi797sJtaxzpP3l0L6AfMJZE1jq7q/JletLXiVED8JM2Mkgmh8pgemMqK+pjU5snNqj
 4SmAIY9xpkUFJTwb6KQRCHmClshfbax662MBwNLdyc71cKI+Ht6zOLscmyap13Cm8Jdl
 Pvwlu0PYjCt12ID8IEZH3heQS/YN134MrRK3B4SP56jTUo+ckVMsH43yk55Yq86rvUs/
 gxA5UuIqE4dGMSW497CceIm6gFxtwaAaA60xM1XmcEKkoJKn5MK0/KWEaiB12sZMfuDR
 xm/A==
X-Forwarded-Encrypted: i=1;
 AJvYcCW84S9V+AQQkYp+0Pg3uFJiqkrinKOD+cj0jo9RwHYKPgQTM0ca31x7++jsQaCnCHVrKhB4AZsrCgxGVc8F2iXDhlG9Twpbk1TuCelrLjExzQK5aDvFn2pyX1jXjUlDgWGnQskZ+ly86pfRZuSc6zLRTs1VtmYF1ktL1pi43uQwDvDiil12jcTRLBPiIPHnFnT4xag5EJJM5dDha3MF/IDYBm+KEn5/IQcomA3GYVFHVuXIiU3syvBp4mciUubTWnoJGGoBTfuVBZ+umC0D3La4taNF/wXygvGVcQ==
X-Gm-Message-State: AOJu0YxBCqzw8NXdwxSkflidZiBTQf2FxMt5MAFfeqN8T6V6IoSKYHDr
 LtNNbixGctgBJMaMxDf8ZKejURE+MphiwvxQexQkxWspvI/JgsQUap7XnuBlDVsr+sE+TBpgATD
 eqRNYh5vFsGTaYQ4ptCAJ0U5K7iE=
X-Google-Smtp-Source: AGHT+IEUljvEWt6RLJvm0ZvDNAAvbKF98d8W07FBneubUp0ru50ICaCtTHNp6cmd+wxEi3ZRk7j/LT8mS1rRQW2OsKc=
X-Received: by 2002:a05:6e02:3710:b0:366:ab6f:f63 with SMTP id
 ck16-20020a056e02371000b00366ab6f0f63mr8646788ilb.3.1711852485494; Sat, 30
 Mar 2024 19:34:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: netdev@vger.kernel.org
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
X-EXCLAIMER-MD-CONFIG: 2c86f778-e09b-4440-8b15-867914633a10
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
bHNhQGtlcm5lbC5vcmcvCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1h
bi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFp
bG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
