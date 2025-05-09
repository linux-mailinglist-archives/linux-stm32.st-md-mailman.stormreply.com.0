Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CC30DAB1B32
	for <lists+linux-stm32@lfdr.de>; Fri,  9 May 2025 19:04:32 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 45869C78F99;
	Fri,  9 May 2025 17:04:32 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com
 [209.85.128.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 96882C78F96
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  9 May 2025 17:04:30 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id
 5b1f17b1804b1-43cfebc343dso16602735e9.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 09 May 2025 10:04:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1746810270; x=1747415070;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=g9FGoOFxXhMGTP5ls91WbfqbKMEzNeTHiP62ZYlEVbw=;
 b=Z3Q6/FHr2vbx6PbI75jDM2+s3Ji1mMFHbZ1ifEwS8dJ6cG2eZETA7UgWHriAL+2rnG
 Ep87jSr6O054x0I1/EoI0hhG+moC3Ouo0JdsZ0MMGNx7nA+CmU9hsbJgjS5a5xjZQUhc
 fXiwU9E+/Jd01ht5wuhVChfoLEJ8XXUUM2TZ7YvNu4s0DaSy0abi2F2MY3R9toXnQe3d
 9qmDrvnIOwOsV+ADlxSZmAaHDFPquwFTrvozDeN0zFyiR5DNHfwt8S0udOtAWrjSwcyl
 yheTnytF9GgIiwEpgjqtAU39cki/DD9OiFf0HmvfXhQLBwAQC9N7frxznFlktE+W8Urj
 AsXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746810270; x=1747415070;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=g9FGoOFxXhMGTP5ls91WbfqbKMEzNeTHiP62ZYlEVbw=;
 b=Q9TFgehA0eZC+OTfNXUG4z15QtKwsC4LYs4wdkeJiEbGnPMX34dLLdfKxl9hYaGKxE
 l1MzG93i08+HUXYp6HfwwLDZQX/JqrjaEDQB815jRsxl6uoPLbCrE7DHwnYC/uHCAHLY
 mBrgOJPsg6AtkO/wRC3gmkRndnz8q3aGNc8dxQBOkZahvwDk1f8ygQw9ZkXTrCxHequF
 wD/PTPnItOkj8sDaAtB8jUftM0hv3G8QvnBsHqsw9UNQqyZBYmkdOCvsdc5RJbSBIFj8
 9Pv/5NjjnXrBuC7EVssgYimBCaqZg2xeR8OmEQYheW8C3ZyOqjCZ64bqOF0epFYJbhxd
 mwjw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWMHyqwZE0ocnr/ka+0qLa3AfeGdIkN2Bw7KhCzxwpW4JOhvBMHi9WhkmQA0kBal/TjgpXkVyOyQRFtfg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yx2fRrNAfLPCnxlZ7zgWtpNnAMQKQAs74gDFru/YXMmv96SUdnc
 xdTilY6aL546oS2zp8TVrTcftZ/iqe8GEq6OSe3zzGCY725noGpRJ9EZKv3bup1JrSS5k17eDd6
 888veRkx1oAyhlmzT9PlDrIJDplo=
X-Gm-Gg: ASbGnctHOTavbL74GWtJyidhfhAY2ja7VrnSat9ccdupEZbZxYqJFZVVtblr8nL22zj
 Ax2Pk9w3pCryrz9j/eHxiBCce7M+6NlGHv2307I2uERI0j6JLhzzn+Mk7DNrxBukh24xiHuSW6T
 4POSK7ZR/ZIcTQ3pcHAtGqFdY236xDXzpCtCUy1A==
X-Google-Smtp-Source: AGHT+IFnBYqhXbjNCF8NTXyLF6urD2/hEu6wcbrtnXUvS6VeJLvXHUVn+vYN/eT8TSsjCML7ULcEftXd3SA1OPWI14w=
X-Received: by 2002:a05:600c:64c4:b0:43c:fe15:41e1 with SMTP id
 5b1f17b1804b1-442d6d18bc6mr39356315e9.4.1746810269524; Fri, 09 May 2025
 10:04:29 -0700 (PDT)
MIME-Version: 1.0
References: <20250509122348.649064-1-skb99@linux.ibm.com>
In-Reply-To: <20250509122348.649064-1-skb99@linux.ibm.com>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Fri, 9 May 2025 10:04:18 -0700
X-Gm-Features: AX0GCFtGvd38TEcBIzgZXpP366MKGCZNb_SZxydI264Su3mUoJ1EjhzLUKYHED8
Message-ID: <CAADnVQKBQqur68RdwbDVpRuAZE=8Y=_JaTFo-36d_4vr2DNVyw@mail.gmail.com>
To: Saket Kumar Bhaskar <skb99@linux.ibm.com>
Cc: Jiri Olsa <jolsa@kernel.org>, Hao Luo <haoluo@google.com>,
 Mykola Lysenko <mykolal@fb.com>, Madhavan Srinivasan <maddy@linux.ibm.com>,
 Yonghong Song <yonghong.song@linux.dev>,
 Daniel Borkmann <daniel@iogearbox.net>, Song Liu <song@kernel.org>,
 Stanislav Fomichev <sdf@fomichev.me>, Shuah Khan <shuah@kernel.org>,
 John Fastabend <john.fastabend@gmail.com>, LKML <linux-kernel@vger.kernel.org>,
 Alexei Starovoitov <ast@kernel.org>, Andrii Nakryiko <andrii@kernel.org>,
 Linux-Next Mailing List <linux-next@vger.kernel.org>,
 Hari Bathini <hbathini@linux.ibm.com>,
 "open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>,
 KP Singh <kpsingh@kernel.org>, bpf <bpf@vger.kernel.org>,
 Martin KaFai Lau <martin.lau@linux.dev>,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH] selftests/bpf: Fix bpf selftest build
	error
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

T24gRnJpLCBNYXkgOSwgMjAyNSBhdCA1OjI04oCvQU0gU2FrZXQgS3VtYXIgQmhhc2thciA8c2ti
OTlAbGludXguaWJtLmNvbT4gd3JvdGU6Cj4KPiBPbiBsaW51eC1uZXh0LCBidWlsZCBmb3IgYnBm
IHNlbGZ0ZXN0IGRpc3BsYXlzIGFuIGVycm9yIGR1ZSB0bwo+IG1pc21hdGNoIGluIHRoZSBleHBl
Y3RlZCBmdW5jdGlvbiBzaWduYXR1cmUgb2YgYnBmX3Rlc3Rtb2RfdGVzdF9yZWFkCj4gYW5kIGJw
Zl90ZXN0bW9kX3Rlc3Rfd3JpdGUuCj4KPiBDb21taXQgOTdkMDY4MDJkMTBhICgic3lzZnM6IGNv
bnN0aWZ5IGJpbl9hdHRyaWJ1dGUgYXJndW1lbnQgb2YgYmluX2F0dHJpYnV0ZTo6cmVhZC93cml0
ZSgpIikKPiBjaGFuZ2VkIHRoZSByZXF1aXJlZCB0eXBlIGZvciBzdHJ1Y3QgYmluX2F0dHJpYnV0
ZSB0byBjb25zdCBzdHJ1Y3QgYmluX2F0dHJpYnV0ZS4KPgo+IFRvIHJlc29sdmUgdGhlIGVycm9y
LCB1cGRhdGUgY29ycmVzcG9uZGluZyBzaWduYXR1cmUgZm9yIHRoZSBjYWxsYmFjay4KPgo+IFJl
cG9ydGVkLWJ5OiBWZW5rYXQgUmFvIEJhZ2Fsa290ZSA8dmVua2F0ODhAbGludXguaWJtLmNvbT4K
PiBDbG9zZXM6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2FsbC9lOTE1ZGE0OS0yYjlhLTRjNGMt
YTM0Zi04NzdmMzc4MTI5ZjZAbGludXguaWJtLmNvbS8KPiBTaWduZWQtb2ZmLWJ5OiBTYWtldCBL
dW1hciBCaGFza2FyIDxza2I5OUBsaW51eC5pYm0uY29tPgo+IC0tLQo+ICB0b29scy90ZXN0aW5n
L3NlbGZ0ZXN0cy9icGYvdGVzdF9rbW9kcy9icGZfdGVzdG1vZC5jIHwgNCArKy0tCj4gIDEgZmls
ZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCj4KPiBkaWZmIC0tZ2l0
IGEvdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMvYnBmL3Rlc3Rfa21vZHMvYnBmX3Rlc3Rtb2QuYyBi
L3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2JwZi90ZXN0X2ttb2RzL2JwZl90ZXN0bW9kLmMKPiBp
bmRleCAyZTU0Yjk1YWQ4OTguLjE5NGM0NDI1ODBlZSAxMDA2NDQKPiAtLS0gYS90b29scy90ZXN0
aW5nL3NlbGZ0ZXN0cy9icGYvdGVzdF9rbW9kcy9icGZfdGVzdG1vZC5jCj4gKysrIGIvdG9vbHMv
dGVzdGluZy9zZWxmdGVzdHMvYnBmL3Rlc3Rfa21vZHMvYnBmX3Rlc3Rtb2QuYwo+IEBAIC0zODUs
NyArMzg1LDcgQEAgaW50IGJwZl90ZXN0bW9kX2ZlbnRyeV9vazsKPgo+ICBub2lubGluZSBzc2l6
ZV90Cj4gIGJwZl90ZXN0bW9kX3Rlc3RfcmVhZChzdHJ1Y3QgZmlsZSAqZmlsZSwgc3RydWN0IGtv
YmplY3QgKmtvYmosCj4gLSAgICAgICAgICAgICAgICAgICAgIHN0cnVjdCBiaW5fYXR0cmlidXRl
ICpiaW5fYXR0ciwKPiArICAgICAgICAgICAgICAgICAgICAgY29uc3Qgc3RydWN0IGJpbl9hdHRy
aWJ1dGUgKmJpbl9hdHRyLAo+ICAgICAgICAgICAgICAgICAgICAgICBjaGFyICpidWYsIGxvZmZf
dCBvZmYsIHNpemVfdCBsZW4pCgpZb3UgZGlkbid0IGV2ZW4gY29tcGlsZSBpdCA6KAoKSW5zdGVh
ZCBvZiBmaXhpbmcgdGhlIGJ1aWxkLCBpdCBicmVha3MgdGhlIGJ1aWxkLgoKcHctYm90OiBjcgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0z
MiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpo
dHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51
eC1zdG0zMgo=
