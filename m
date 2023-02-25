Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A0EF36A2764
	for <lists+linux-stm32@lfdr.de>; Sat, 25 Feb 2023 06:47:37 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 41ABBC65E70;
	Sat, 25 Feb 2023 05:47:37 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com
 [209.85.221.51])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EC34FC65E4C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 25 Feb 2023 05:47:35 +0000 (UTC)
Received: by mail-wr1-f51.google.com with SMTP id bo30so1318106wrb.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 24 Feb 2023 21:47:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LiST8596u5SW2OT95mO4vwyxbo+eN0yAsaEYN7M3IJc=;
 b=p1goS1GxDpHe69NI5SRLq8F4rfieQ+bExX2nozq4F4kWhGFIEqxvgFQ9gmMLOeq7Od
 Zf38tlyAYp5g3DPIE6RBTOXQf9Q/jFjI8AcsXycD7zs0kij6ZvJslExLb5lLfBwVsePr
 MbOdyfxJz65BgV557DZiHpcgDMSZgQysKIyLJ1+MFpBAeyIznQRgI+pPwKRqNw9SX3/9
 FzHixX0BXXZ2FNKGIqLE1CRGu+AMELTOrJqAZZF0M7fflx9eGDdLKaiiKc657gwqFdK4
 oEb6Is/wm4HCNHkLfV6TEnme0uFORY8idWB9xLe2soxHasGEHz1+3YJZHPYjVfxPxhbe
 PRUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=LiST8596u5SW2OT95mO4vwyxbo+eN0yAsaEYN7M3IJc=;
 b=v+lu6dWrU7E5QqRDPUytPR6BmVBSc73D64haX37/FH4iwEfYoMSMsngUzoFII1CgA5
 x2VuitUySFImEtG+aedw6wmGFcPcRdhRImQ324IZH53S8US0wpADZTSRHltJVBdRM48e
 vfJCFmOrQLwJsLWKB3+6XjX0Hxb5b6xC8AHe2kbTXF5BHR9IN8vjI8vMeklDpVs0VWhq
 X6176xoFGBkD1S4jmG3I+mmpFnUT6z6M1aLl52ysSfOsT9dqA5TICSJ3VvOMfGVeEu6G
 jSuOzyslB/dbee6NVx4TVHRdRm00sQBb5pfEkhfSx2qRkbq1fN3C/ZBkJPkV4J3qelEy
 TplQ==
X-Gm-Message-State: AO0yUKWanQ8F3uZjJhAYj5x73RFjJQTTj0KzpVAzpNOimeua5Txe95WV
 q2795UtOjysW4K3yQY79LDBNr8aaI8lWZs64QfC8CA==
X-Google-Smtp-Source: AK7set+a3nC9KQjdJ0kZohZ+u36oNsTS7RmKWeZajLQ2c7xaDgResXUAlsshR4qweCkPqQiFGEpAV7XuUVi2FhFLwNU=
X-Received: by 2002:a5d:6401:0:b0:2c5:fd95:c495 with SMTP id
 z1-20020a5d6401000000b002c5fd95c495mr1623328wru.4.1677304055182; Fri, 24 Feb
 2023 21:47:35 -0800 (PST)
MIME-Version: 1.0
References: <20230219092848.639226-1-irogers@google.com>
 <20230219092848.639226-51-irogers@google.com>
 <Y/k+p8IPY/ftl3KQ@google.com>
In-Reply-To: <Y/k+p8IPY/ftl3KQ@google.com>
From: Ian Rogers <irogers@google.com>
Date: Fri, 24 Feb 2023 21:47:22 -0800
Message-ID: <CAP-5=fWtziP7HzXKZHKxZdQuQ=sTEyNVKNkPVnhYNF-BcX8eKw@mail.gmail.com>
To: Namhyung Kim <namhyung@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, Sandipan Das <sandipan.das@amd.com>,
 Peter Zijlstra <peterz@infradead.org>, Perry Taylor <perry.taylor@intel.com>,
 Stephane Eranian <eranian@google.com>, linux-kernel@vger.kernel.org,
 James Clark <james.clark@arm.com>, linux-stm32@st-md-mailman.stormreply.com,
 Kan Liang <kan.liang@linux.intel.com>,
 Suzuki Poulouse <suzuki.poulose@arm.com>, Andrii Nakryiko <andrii@kernel.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Ingo Molnar <mingo@redhat.com>, Zhengjun Xing <zhengjun.xing@linux.intel.com>,
 Jiri Olsa <jolsa@kernel.org>, John Garry <john.g.garry@oracle.com>,
 Kajol Jain <kjain@linux.ibm.com>, Arnaldo Carvalho de Melo <acme@kernel.org>,
 Caleb Biggers <caleb.biggers@intel.com>, linux-arm-kernel@lists.infradead.org,
 Athira Rajeev <atrajeev@linux.vnet.ibm.com>,
 Sean Christopherson <seanjc@google.com>, Ravi Bangoria <ravi.bangoria@amd.com>,
 Florian Fischer <florian.fischer@muhq.space>,
 Adrian Hunter <adrian.hunter@intel.com>, linux-perf-users@vger.kernel.org,
 Eduard Zingerman <eddyz87@gmail.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Leo Yan <leo.yan@linaro.org>,
 Jing Zhang <renyu.zj@linux.alibaba.com>
Subject: Re: [Linux-stm32] [PATCH v1 50/51] perf stat: Use counts rather
	than saved_value
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

T24gRnJpLCBGZWIgMjQsIDIwMjMgYXQgMjo0OOKAr1BNIE5hbWh5dW5nIEtpbSA8bmFtaHl1bmdA
a2VybmVsLm9yZz4gd3JvdGU6Cj4KPiBPbiBTdW4sIEZlYiAxOSwgMjAyMyBhdCAwMToyODo0N0FN
IC0wODAwLCBJYW4gUm9nZXJzIHdyb3RlOgo+ID4gU3dpdGNoIHRoZSBoYXJkIGNvZGVkIG1ldHJp
Y3MgdG8gdXNlIHRoZSBhZ2dyZWdhdGUgdmFsdWUgcmF0aGVyIHRoYW4KPiA+IGZyb20gc2F2ZWRf
dmFsdWUuIFdoZW4gY29tcHV0aW5nIGEgbWV0cmljIGxpa2UgSVBDIHRoZSBhZ2dyZWdhdGUgY291
bnQKPiA+IGNvbWVzIGZyb20gaW5zdHJ1Y3Rpb25zIHRoZW4gY3ljbGVzIGlzIGxvb2tlZCB1cCBh
bmQgaWYgcHJlc2VudCBJUEMKPiA+IGNvbXB1dGVkLiBSYXRoZXIgdGhhbiBsb29rdXAgZnJvbSB0
aGUgc2F2ZWRfdmFsdWUgcmJ0cmVlLCBzZWFyY2ggdGhlCj4gPiBjb3VudGVyJ3MgZXZsaXN0IGZv
ciB0aGUgZGVzaXJlZCBjb3VudGVyLgo+ID4KPiA+IEEgbmV3IGhlbHBlciBldnNlbF9fc3RhdF90
eXBlIGlzIHVzZWQgdG8gYm90aCBxdWlja2x5IGZpbmQgYSBtZXRyaWMKPiA+IGZ1bmN0aW9uIGFu
ZCB0byBpZGVudGlmeSB3aGVuIGEgY291bnRlciBpcyB0aGUgb25lIGJlaW5nIHNvdWdodC4gU28K
PiA+IHRoYXQgYm90aCB0b3RhbCBhbmQgbWlzcyBjb3VudHMgY2FuIGJlIHNvdWdodCwgdGhlIHN0
YXRfdHlwZSBlbnVtIGlzCj4gPiBleHBhbmRlZC4gVGhlIHJhdGlvIGZ1bmN0aW9ucyBhcmUgcmV3
cml0dGVuIHRvIHNoYXJlIGEgY29tbW9uIGhlbHBlcgo+ID4gd2l0aCB0aGUgcmF0aW9zIGJlaW5n
IGRpcmVjdGx5IHBhc3NlZCByYXRoZXIgdGhhbiBjb21wdXRlZCBmcm9tIGFuCj4gPiBlbnVtIHZh
bHVlLgo+ID4KPiA+IFNpZ25lZC1vZmYtYnk6IElhbiBSb2dlcnMgPGlyb2dlcnNAZ29vZ2xlLmNv
bT4KPiA+IC0tLQo+IFtTTklQXQo+ID4gLXN0YXRpYyBkb3VibGUgcnVudGltZV9zdGF0X2F2Zyhl
bnVtIHN0YXRfdHlwZSB0eXBlLCBpbnQgYWdncl9pZHgsCj4gPiAtICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIHN0cnVjdCBydW50aW1lX3N0YXRfZGF0YSAqcnNkKQo+ID4gK3N0YXRpYyBkb3Vi
bGUgZmluZF9zdGF0KGNvbnN0IHN0cnVjdCBldnNlbCAqZXZzZWwsIGludCBhZ2dyX2lkeCwgZW51
bSBzdGF0X3R5cGUgdHlwZSkKPiA+ICB7Cj4gPiAtICAgICBzdHJ1Y3Qgc2F2ZWRfdmFsdWUgKnY7
Cj4gPiAtCj4gPiAtICAgICB2ID0gc2F2ZWRfdmFsdWVfbG9va3VwKE5VTEwsIGFnZ3JfaWR4LCBm
YWxzZSwgdHlwZSwgcnNkLT5jdHgsIHJzZC0+Y2dycCk7Cj4gPiAtICAgICBpZiAoIXYpCj4gPiAt
ICAgICAgICAgICAgIHJldHVybiAwLjA7Cj4gPiAtCj4gPiAtICAgICByZXR1cm4gYXZnX3N0YXRz
KCZ2LT5zdGF0cyk7Cj4gPiArICAgICBjb25zdCBzdHJ1Y3QgZXZzZWwgKmN1cjsKPiA+ICsgICAg
IGludCBldnNlbF9jdHggPSBldnNlbF9jb250ZXh0KGV2c2VsKTsKPiA+ICsKPiA+ICsgICAgIGV2
bGlzdF9fZm9yX2VhY2hfZW50cnkoZXZzZWwtPmV2bGlzdCwgY3VyKSB7Cj4gPiArICAgICAgICAg
ICAgIHN0cnVjdCBwZXJmX3N0YXRfYWdnciAqYWdncjsKPiA+ICsKPiA+ICsgICAgICAgICAgICAg
LyogSWdub3JlIHRoZSBldnNlbCB0aGF0IGlzIGJlaW5nIHNlYXJjaGVkIGZyb20uICovCj4gPiAr
ICAgICAgICAgICAgIGlmIChldnNlbCA9PSBjdXIpCj4gPiArICAgICAgICAgICAgICAgICAgICAg
Y29udGludWU7Cj4gPiArCj4gPiArICAgICAgICAgICAgIC8qIElnbm9yZSBldnNlbHMgdGhhdCBh
cmUgcGFydCBvZiBkaWZmZXJlbnQgZ3JvdXBzLiAqLwo+ID4gKyAgICAgICAgICAgICBpZiAoZXZz
ZWwtPmNvcmUubGVhZGVyLT5ucl9tZW1iZXJzICYmCj4gPiArICAgICAgICAgICAgICAgICBldnNl
bC0+Y29yZS5sZWFkZXIgIT0gY3VyLT5jb3JlLmxlYWRlcikKPgo+IFRoZSBldnNlbC0+bnJfbWVt
YmVycyBpcyBzb21ld2hhdCBjb25mdXNpbmcgaW4gdGhhdCBpdCBjb3VudHMgaXRzZWxmCj4gYXMg
YSBtZW1iZXIuICBJJ20gbm90IHN1cmUgaXQgcmVzZXRzIHRoZSBucl9tZW1iZXJzIHRvIDAgZm9y
IHN0YW5kYWxvbmUKPiBldmVudHMuICBZb3UnZCBiZXR0ZXIgY2hlY2tpbmcgbnJfbWVtYmVycyBn
cmVhdGVyIHRoYW4gMSBmb3IgZ3JvdXAKPiBldmVudHMuCgpBZ3JlZWQuIFRoZSBjb2RlIGlzIGNv
cnJlY3QgYXMgdGhlIG5yX21lbWJlcnMgaXMgb25seSBzZXQgd2hlbiB0aGUKZ3JvdXAgaXMgY2xv
c2VkIGJ5IHRoZSBjYWxsIHRvIHBhcnNlX2V2ZW50c19zZXRfbGVhZGVyLCBzdGFuZGFsb25lCmV2
ZW50cyBkb24ndCBjbG9zZSBhIGdyb3VwIGFuZCBzbyBoYXZlIG5yX21lbWJlcnMgb2YgMCwgYnV0
IEkgYWdyZWUKdGhhdCdzIGNvbmZ1c2luZy4KCkknbSBhY3R1YWxseSBsb29raW5nIGF0IGEgcmVs
YXRlZCBidWcgd2hlcmUgdGVsbGluZyBtZXRyaWNzIG5vdCB0bwpncm91cCBldmVudHMgYnJlYWtz
IHRoZSB0b3Bkb3duIGV2ZW50cyB0aGF0IG11c3QgYmUgZ3JvdXBlZCB3aXRoCnNsb3RzLgoKT25l
IHRoaW5nIHRoYXQgYnVncyBtZSBpcyB0aGUgbGlicGVyZiBldnNlbCBpZHggdmFyaWFibGUuIFdo
ZW4gYW4KZXZzZWwgaXMgYWRkZWQgdG8gYW4gZXZsaXN0IHRoZSBpZHggaXMgdGhhdCBudW1iZXIg
b2YgZWxlbWVudHMgaW4gdGhlCmV2bGlzdC4gSG93ZXZlciwgd2UgcmVvcmdhbml6ZSB0aGUgbGlz
dCBpbiBwYXJzZS1ldmVudHMgYW5kIHNvIHRoZSBpZHgKaXMganVzdCBhIGhvcGVmdWxseSB1bmlx
dWUgdmFsdWUgaW4gdGhlIGxpc3QuIEluIHBsYWNlcyBpbiBwYXJzZQpldmVudHMgd2UgdXNlIHRo
ZSBpZHggZm9yIGNvbXB1dGluZyB0aGUgbGVuZ3RoIG9mIHRoZSBldmxpc3QgYnkKc3VidHJhY3Rp
bmcgdGhlIGxhc3QgaWR4IGZyb20gdGhlIGZpcnN0IGFuZCBhZGRpbmcgMS4gUmVtb3ZpbmcgdGhl
IGlkeAppc24ndCBzdHJhaWdodGZvcndhcmQgdGhvdWdoIGFzIGxhdGVyIG9uIGl0IGlzIHVzZWQg
Zm9yIG1tYXBzLgoKVGhhbmtzLApJYW4KCj4gVGhhbmtzLAo+IE5hbWh5dW5nCj4KPgo+ID4gKyAg
ICAgICAgICAgICAgICAgICAgIGNvbnRpbnVlOwo+ID4gKyAgICAgICAgICAgICAvKiBJZ25vcmUg
ZXZzZWxzIHdpdGggbWlzbWF0Y2hlZCBtb2RpZmllcnMuICovCj4gPiArICAgICAgICAgICAgIGlm
IChldnNlbF9jdHggIT0gZXZzZWxfY29udGV4dChjdXIpKQo+ID4gKyAgICAgICAgICAgICAgICAg
ICAgIGNvbnRpbnVlOwo+ID4gKyAgICAgICAgICAgICAvKiBJZ25vcmUgaWYgbm90IHRoZSBjZ3Jv
dXAgd2UncmUgbG9va2luZyBmb3IuICovCj4gPiArICAgICAgICAgICAgIGlmIChldnNlbC0+Y2dy
cCAhPSBjdXItPmNncnApCj4gPiArICAgICAgICAgICAgICAgICAgICAgY29udGludWU7Cj4gPiAr
ICAgICAgICAgICAgIC8qIElnbm9yZSBpZiBub3QgdGhlIHN0YXQgd2UncmUgbG9va2luZyBmb3Iu
ICovCj4gPiArICAgICAgICAgICAgIGlmICh0eXBlICE9IGV2c2VsX19zdGF0X3R5cGUoY3VyKSkK
PiA+ICsgICAgICAgICAgICAgICAgICAgICBjb250aW51ZTsKPiA+ICsKPiA+ICsgICAgICAgICAg
ICAgYWdnciA9ICZjdXItPnN0YXRzLT5hZ2dyW2FnZ3JfaWR4XTsKPiA+ICsgICAgICAgICAgICAg
aWYgKHR5cGUgPT0gU1RBVF9OU0VDUykKPiA+ICsgICAgICAgICAgICAgICAgICAgICByZXR1cm4g
YWdnci0+Y291bnRzLnZhbDsKPiA+ICsgICAgICAgICAgICAgcmV0dXJuIGFnZ3ItPmNvdW50cy52
YWwgKiBjdXItPnNjYWxlOwo+ID4gKyAgICAgfQo+ID4gKyAgICAgcmV0dXJuIDAuMDsKPiA+ICB9
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0
bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29t
Cmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LXN0bTMyCg==
