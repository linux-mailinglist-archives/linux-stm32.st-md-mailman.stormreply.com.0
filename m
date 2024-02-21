Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 84DC085CE0F
	for <lists+linux-stm32@lfdr.de>; Wed, 21 Feb 2024 03:35:48 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1097FC6B45E;
	Wed, 21 Feb 2024 02:35:48 +0000 (UTC)
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com
 [209.85.216.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 47E25C69063
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 21 Feb 2024 02:35:47 +0000 (UTC)
Received: by mail-pj1-f46.google.com with SMTP id
 98e67ed59e1d1-299d3b09342so1349121a91.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 20 Feb 2024 18:35:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance.com; s=google; t=1708482946; x=1709087746;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=p9KaH1kG3VIAPvn6SehcGM/nl6oCx50robP1zVqyyiY=;
 b=VtgG1IjxjGVE5CwfJ0gCrGSKNDazZgCDYNkXe46mUCxHKDsoaiJJC+MukXvLt25Nq6
 HLagZKp9HleABD8p0fYKu432UZcH9tsVsw1MmLl5y56Iwb02EpY7ynVl7A2hVESQq28R
 cZ2WymaYt1HUVd+4up4s/1kt39htWieXStmCmvIUwQU+C0zWnu50/wdrd0vBxz89mHVV
 pb25gSD6rlP8OdLdu4Pb8P5GN1c1tdBZdusk5CfXd6aGxX7vg8LzCevTC+d77usXVR2e
 Dau5tnZirnsWRMFZy3rmgyi+nyYnx91LeEckwjc+Ytjnnl+PBeOc3+Htxa+G7AmdMcS/
 mBuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708482946; x=1709087746;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=p9KaH1kG3VIAPvn6SehcGM/nl6oCx50robP1zVqyyiY=;
 b=n8dcDctxVPdb/rWJ6niXzv260j6Sab8XHtFWzh/utbGofmAJR8pDzAnf4g/IjG2BSR
 vpdEgigcpMY4XIuvL0IRn+WWhjvx98SJW/q3QEGtGqol0nejF//svlbpgZCeH+mo/l70
 xXe0Ha3z6XtRScdKT0H8MEzgz5e1Vfk6nOm+FQHIu57GsIoIH7i1pKccKsa1TDhdxkWy
 gtGqx8AZn7osJ/ZBRJYWbJtBxp3yf9x38a+Qh4n8EfqGuHpBJQanuhMG4j6GPAWRe1Jf
 6L3zljE2DvY4pilmUWp5bmMoM8nnS+n+E0Gky16NkTe2cvYS5f+CS9jqAqEwFmDxkfwK
 BbwQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCU0+8iv+eVgFh+SGbkB22PH+rTHb7O099WFTBmWpKqe5v0fVsHtAVYV8LSad0K4TQVz4VFznEp60V4U5wY1e9yVoE5A9tu3aHk1f1yZUNDzGwGLkiC4FzqC
X-Gm-Message-State: AOJu0YwPoUhdGd38cQiuOPhI/Sxy1Bds4Q5PJlBKuMvAhLs3JzEvVqjD
 JMhri1WyheP8r1n71sgM/myxMi+TqXdmt9zA94IMiS2m0ZG4dJ9E/56mo/BCKVgdiYbGBbJB5DA
 VPwT8/4bCRg/EtAlkIJk51Sycf6m/2M+gXlpqAw==
X-Google-Smtp-Source: AGHT+IGBqVse+WdjABfmLP3ERXaSmAAVszht4JUGqKAyn/R0pWRIclJneX1cjoLELZhhU7yURPemUQm9OhzpBLcsGpM=
X-Received: by 2002:a17:90b:1bc1:b0:299:6717:e54d with SMTP id
 oa1-20020a17090b1bc100b002996717e54dmr8268880pjb.36.1708482945724; Tue, 20
 Feb 2024 18:35:45 -0800 (PST)
MIME-Version: 1.0
References: <20240220035105.34626-1-dongmenglong.8@bytedance.com>
 <CAADnVQ+E4ygZV6dcs8wj5FdFz9bfrQ=61235uiRoxe9RqQvR9Q@mail.gmail.com>
In-Reply-To: <CAADnVQ+E4ygZV6dcs8wj5FdFz9bfrQ=61235uiRoxe9RqQvR9Q@mail.gmail.com>
From: =?UTF-8?B?5qKm6b6Z6JGj?= <dongmenglong.8@bytedance.com>
Date: Wed, 21 Feb 2024 10:35:34 +0800
Message-ID: <CALz3k9g__P+UdO2vLPrR5Y4sQonQJjOnGPNmhmxtRfhLKoV7Rg@mail.gmail.com>
To: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Cc: "open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>,
 Dave Marchevsky <davemarchevsky@fb.com>, Song Liu <song@kernel.org>,
 Stanislav Fomichev <sdf@google.com>, Yonghong Song <yonghong.song@linux.dev>,
 Kui-Feng Lee <thinker.li@gmail.com>, Shuah Khan <shuah@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, Mykola Lysenko <mykolal@fb.com>,
 Daniel Borkmann <daniel@iogearbox.net>,
 John Fastabend <john.fastabend@gmail.com>, Andrii Nakryiko <andrii@kernel.org>,
 Feng Zhou <zhoufeng.zf@bytedance.com>, mcoquelin.stm32@gmail.com,
 Alexei Starovoitov <ast@kernel.org>, Daniel Xu <dxu@dxuuu.xyz>,
 KP Singh <kpsingh@kernel.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 Hao Luo <haoluo@google.com>, LKML <linux-kernel@vger.kernel.org>,
 Eddy Z <eddyz87@gmail.com>, Jiri Olsa <jolsa@kernel.org>,
 bpf <bpf@vger.kernel.org>, Martin KaFai Lau <martin.lau@linux.dev>
Subject: Re: [Linux-stm32] [External] Re: [PATCH bpf-next 0/5] bpf: make
 tracing program support multi-attach
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

SGVsbG8sCgpPbiBXZWQsIEZlYiAyMSwgMjAyNCBhdCA5OjI04oCvQU0gQWxleGVpIFN0YXJvdm9p
dG92CjxhbGV4ZWkuc3Rhcm92b2l0b3ZAZ21haWwuY29tPiB3cm90ZToKPgo+IE9uIE1vbiwgRmVi
IDE5LCAyMDI0IGF0IDc6NTHigK9QTSBNZW5nbG9uZyBEb25nCj4gPGRvbmdtZW5nbG9uZy44QGJ5
dGVkYW5jZS5jb20+IHdyb3RlOgo+ID4KPiA+IEZvciBub3csIHRoZSBCUEYgcHJvZ3JhbSBvZiB0
eXBlIEJQRl9QUk9HX1RZUEVfVFJBQ0lORyBpcyBub3QgYWxsb3dlZCB0bwo+ID4gYmUgYXR0YWNo
ZWQgdG8gbXVsdGlwbGUgaG9va3MsIGFuZCB3ZSBoYXZlIHRvIGNyZWF0ZSBhIEJQRiBwcm9ncmFt
IGZvcgo+ID4gZWFjaCBrZXJuZWwgZnVuY3Rpb24sIGZvciB3aGljaCB3ZSB3YW50IHRvIHRyYWNl
LCBldmVuIHRocm91Z2ggYWxsIHRoZQo+ID4gcHJvZ3JhbSBoYXZlIHRoZSBzYW1lIChvciBzaW1p
bGFyKSBsb2dpYy4gVGhpcyBjYW4gY29uc3VtZSBleHRyYSBtZW1vcnksCj4gPiBhbmQgbWFrZSB0
aGUgcHJvZ3JhbSBsb2FkaW5nIHNsb3cgaWYgd2UgaGF2ZSBwbGVudHkgb2Yga2VybmVsIGZ1bmN0
aW9uIHRvCj4gPiB0cmFjZS4KPgo+IFNob3VsZCB0aGlzIGJlIGNvbWJpbmVkIHdpdGggbXVsdGkg
bGluayA/Cj4gKEFzIHdhcyByZWNlbnRseSBkb25lIGZvciBrcHJvYmVfbXVsdGkgYW5kIHVwcm9i
ZV9tdWx0aSkuCj4gTG9hZGluZyBmZW50cnkgcHJvZyBvbmNlIGFuZCBhdHRhY2hpbmcgaXQgdGhy
b3VnaCBtYW55IGJwZl9saW5rcwo+IHRvIG11bHRpcGxlIHBsYWNlcyBpcyBhIG5pY2UgYWRkaXRp
b24sCj4gYnV0IHdlIHNob3VsZCBwcm9iYWJseSBhZGQgYSBtdWx0aSBsaW5rIHJpZ2h0IGF3YXkg
dG9vLgoKSSB3YXMgcGxhbm5pbmcgdG8gaW1wbGVtZW50IHRoZSBtdWx0aSBsaW5rIGZvciB0cmFj
aW5nIGFmdGVyIHRoaXMKc2VyaWVzIGluIGFub3RoZXIgc2VyaWVzLiBJIGNhbiBkbyBpdCB0b2dl
dGhlciB3aXRoIHRoaXMgc2VyaWVzCmlmIHlvdSBwcmVmZXIuCgpUaGFua3MhCk1lbmdsb25nIERv
bmcKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgt
c3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5j
b20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8v
bGludXgtc3RtMzIK
