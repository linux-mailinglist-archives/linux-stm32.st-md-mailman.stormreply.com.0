Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FD6293FA0D
	for <lists+linux-stm32@lfdr.de>; Mon, 29 Jul 2024 17:58:24 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3584CC78F80;
	Mon, 29 Jul 2024 15:58:24 +0000 (UTC)
Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com
 [209.85.210.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CC8F5C6C83A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 22 Jul 2024 08:38:12 +0000 (UTC)
Received: by mail-ot1-f48.google.com with SMTP id
 46e09a7af769-7091558067eso14712a34.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 22 Jul 2024 01:38:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1721637491; x=1722242291;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LLy2SrIyNS/BtIAkKA6BvJoHkOLVxRWMUEDFd16KBRE=;
 b=mZojbYgq2VBY/v2WefuGvrieeVd3Rc4yT9EpWv0cemLBvml+giJTU6tAcVYGwpsn1Z
 5kyl1F04mhg9N5071y5nioNF3odvanI3dnJwlvCQDyALPVqwzjdjsWCyiTARyJJXl8sj
 AGVePkE9cm4BxS0unNw0sTuxsOqQ5QrCEmblwYDwD6M4vFwcpvS7kgY/wU5orEN5DbsH
 Sgey3Tan+EFOkj87VbfdZ/Bd5gXLVg/f5mIx2HU5exH0fDBRBYmk+wUrKcZs+nUN+aW7
 huPO07AjqjVT6DsxuN+md4uVVoFZi5sD8KguLvccsLS5zJiGlHrdm9MlXY2GMdSYJ8su
 4G9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721637491; x=1722242291;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=LLy2SrIyNS/BtIAkKA6BvJoHkOLVxRWMUEDFd16KBRE=;
 b=sCfWCa+g4M0JNhB1wjfg2bXOL2Ot2i5nEGAxKZ4Fz6ApYDNGscQVTROesuBLCGF4vN
 y3CL/qziIR8zrVfvB6161lpaV1r8W161WDLrUxVySGqyJ18J9Wqgg6BpEAv4z2NmEgD/
 GJEVRB7UucDzKpoctZrZPS8Tf/NiKEMcvO9wVybhhtn/x9ZPTHbTQGNhucAq5Ox4poU4
 ZVYqwqSJ7QK5G1cZHb5kSz/BPEeHcorxFvtRILUGYIvU1fWVNOQjok5ViEZsbPW/8QVh
 z/NG3GgvPgSBKR4DKAYPDWJ9HE7Ex5b50vZuOeCxPpLvFGkN2kwsqVZDKrqQe2aRStNE
 OTXQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUlpBX/tH8SXgN9MOxWd0QYJQPquvgw96AE4iWVTYlgi9KyWW1+uFVbN9EkN2YMq0rpBqBdTRMwsvfRNByKlL0PNQObuPZ7Gb3jUMO5FTKRf/+EnR+l61cz
X-Gm-Message-State: AOJu0YzQFOEAXFsrmbRpoREO/6dmexiTFQnkT25mNASYw7KOSwwBG439
 Ht1N8q751tywZSH6LrGl4U0LGn4QPNJM7sFd8aJ7hVzGy6rYRrsED9L1ItHVVRNpsxhJvxHn3Hn
 pzmix2H1OCprOv6otJqCo0SJZNzI=
X-Google-Smtp-Source: AGHT+IED9sgp0XJRTrLdgRC9+QtNiUQcgpNSQZW++T17WK1mNEKhGIErQwceTSb8Zdl4TwT9yetFMFVBBj0lyMUU2OA=
X-Received: by 2002:a05:6830:6486:b0:704:4c66:b6f3 with SMTP id
 46e09a7af769-708fda82511mr9301123a34.7.1721637491606; Mon, 22 Jul 2024
 01:38:11 -0700 (PDT)
MIME-Version: 1.0
References: <20240129104106.43141-1-raphael.gallais-pou@foss.st.com>
 <21f4d43d-4abd-4aca-7abb-7321bcfa0f1d@foss.st.com>
In-Reply-To: <21f4d43d-4abd-4aca-7abb-7321bcfa0f1d@foss.st.com>
From: Yanjun Yang <yangyj.ee@gmail.com>
Date: Mon, 22 Jul 2024 16:38:00 +0800
Message-ID: <CAE8JAfy9NtBa--DnUt2AEZPFnvjU6idj8DqUbaeLaH0DMFvuhw@mail.gmail.com>
To: Philippe CORNU <philippe.cornu@foss.st.com>
X-Mailman-Approved-At: Mon, 29 Jul 2024 15:58:21 +0000
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Yannick Fertre <yannick.fertre@foss.st.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH RESEND v3 0/3] Update STM DSI PHY driver
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

T24gRnJpLCBKdW4gMjgsIDIwMjQgYXQgODo0N+KAr1BNIFBoaWxpcHBlIENPUk5VCjxwaGlsaXBw
ZS5jb3JudUBmb3NzLnN0LmNvbT4gd3JvdGU6Cj4KPgo+Cj4gT24gMS8yOS8yNCAxMTo0MSwgUmFw
aGFlbCBHYWxsYWlzLVBvdSB3cm90ZToKPiA+Cj4gPiBUaGlzIHBhdGNoIHNlcmllcyBhaW1zIHRv
IGFkZCBzZXZlcmFsIGZlYXR1cmVzIG9mIHRoZSBkdy1taXBpLWRzaSBwaHkKPiA+IGRyaXZlciB0
aGF0IGFyZSBtaXNzaW5nIG9yIG5lZWQgdG8gYmUgdXBkYXRlZC4KPiA+Cj4gPiBGaXJzdCBwYXRj
aCB1cGRhdGUgYSBQTSBtYWNyby4KPiA+Cj4gPiBTZWNvbmQgcGF0Y2ggYWRkcyBydW50aW1lIFBN
IGZ1bmN0aW9uYWxpdHkgdG8gdGhlIGRyaXZlci4KPiA+Cj4gPiBUaGlyZCBwYXRjaCBhZGRzIGEg
Y2xvY2sgcHJvdmlkZXIgZ2VuZXJhdGVkIGJ5IHRoZSBQSFkgaXRzZWxmLiAgQXMKPiA+IGV4cGxh
aW5lZCBpbiB0aGUgY29tbWl0IGxvZyBvZiB0aGUgc2Vjb25kIHBhdGNoLCBhIGNsb2NrIGRlY2xh
cmF0aW9uIGlzCj4gPiBtaXNzaW5nLiAgU2luY2UgdGhpcyBjbG9jayBpcyBwYXJlbnQgb2YgJ2Rz
aV9rJywgaXQgbGVhZHMgdG8gYW4gb3JwaGFuCj4gPiBjbG9jay4gIE1vc3QgaW1wb3J0YW50bHkg
dGhpcyBwYXRjaCBpcyBhbiBhbnRpY2lwYXRpb24gZm9yIGZ1dHVyZQo+ID4gdmVyc2lvbnMgb2Yg
dGhlIERTSSBQSFksIGFuZCBpdHMgaW5jbHVzaW9uIHdpdGhpbiB0aGUgZGlzcGxheSBzdWJzeXN0
ZW0KPiA+IGFuZCB0aGUgRFJNIGZyYW1ld29yay4KPiA+Cj4gPiBMYXN0IHBhdGNoIGZpeGVzIGEg
Y29ybmVyIGVmZmVjdCBpbnRyb2R1Y2VkIHByZXZpb3VzbHkuICBTaW5jZSAnZHNpJyBhbmQKPiA+
ICdkc2lfaycgYXJlIGdhdGVkIGJ5IHRoZSBzYW1lIGJpdCBvbiB0aGUgc2FtZSByZWdpc3Rlciwg
Ym90aCByZWZlcmVuY2UKPiA+IHdvcmsgYXMgcGVyaXBoZXJhbCBjbG9jayBpbiB0aGUgZGV2aWNl
LXRyZWUuCj4gPgoKVGhpcyBwYXRjaCAoY29tbWl0IGlkOjE4NWY5OWI2MTQ0MjczNjApIHNlZW1z
IHRvIGJyZWFrIHRoZSBkc2kgb2YKc3RtMzJmNDY5IGNoaXAuCkknbSBub3QgZmFtaWxpYXIgd2l0
aCB0aGUgZHJtIGFuZCB0aGUgY2xvY2sgZnJhbWV3b3JrLCBtYXliZSBpdCdzCmJlY2F1c2UgdGhl
cmUgaXMgbm8KICJja19kc2lfcGh5IiBkZWZpbmVkIGZvciBzdG0zMmY0NjkuClBTOiAgU29ycnkg
Zm9yIHJlY2VpdmluZyBtdWx0aXBsZSBjb3BpZXMgb2YgdGhpcyBlbWFpbCwgSSBmb3Jnb3QgdG8K
dXNlIHBsYWluIHRleHQgbW9kZSBsYXN0IHRpbWUuCgo+ID4gLS0tCj4gPiBDaGFuZ2VzIGluIHYz
LXJlc2VuZDoKPiA+ICAgICAgIC0gUmVtb3ZlZCBsYXN0IHBhdGNoIGFzIGl0IGhhcyBiZWVuIG1l
cmdlZAo+ID4gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGttbC9iZjQ5ZjRjOS05ZTgxLTRjOTEt
OTcyZC0xMzc4MmQ5OTZhYWFAZm9zcy5zdC5jb20vCj4gPgo+ID4gQ2hhbmdlcyBpbiB2MzoKPiA+
ICAgICAgIC0gRml4IHNtYXRjaCB3YXJuaW5nIChkaXNhYmxlIGRzaS0+cGNsayB3aGVuIGNsa19y
ZWdpc3RlciBmYWlscykKPiA+Cj4gPiBDaGFuZ2VzIGluIHYyOgo+ID4gICAgICAgLSBBZGRlZCBw
YXRjaCAxLzQgdG8gdXNlIFNZU1RFTV9TTEVFUF9QTV9PUFMgaW5zdGVhZCBvZiBvbGQgbWFjcm8K
PiA+ICAgICAgICAgYW5kIHJlbW92ZWQgX19tYXliZV91c2VkIGZvciBhY2NvcmRpbmdseQo+ID4g
ICAgICAgLSBDaGFuZ2VkIFNFVF9SVU5USU1FX1BNX09QUyB0byBSVU5USU1FX1BNX09QUwo+ID4K
PiA+IFJhcGhhZWwgR2FsbGFpcy1Qb3UgKDMpOgo+ID4gICAgZHJtL3N0bTogZHNpOiB1c2UgbmV3
IFNZU1RFTV9TTEVFUF9QTV9PUFMoKSBtYWNybwo+ID4gICAgZHJtL3N0bTogZHNpOiBleHBvc2Ug
RFNJIFBIWSBpbnRlcm5hbCBjbG9jawo+ID4KPiA+IFlhbm5pY2sgRmVydHJlICgxKToKPiA+ICAg
IGRybS9zdG06IGRzaTogYWRkIHBtIHJ1bnRpbWUgb3BzCj4gPgo+ID4gICBkcml2ZXJzL2dwdS9k
cm0vc3RtL2R3X21pcGlfZHNpLXN0bS5jIHwgMjc5ICsrKysrKysrKysrKysrKysrKysrKystLS0t
Cj4gPiAgIDEgZmlsZSBjaGFuZ2VkLCAyMzggaW5zZXJ0aW9ucygrKSwgNDEgZGVsZXRpb25zKC0p
Cj4gPgo+Cj4gSGkgUmFwaGHDq2wgJiBZYW5uaWNrLAo+IEFwcGxpZWQgb24gZHJtLW1pc2MtbmV4
dC4KPiBNYW55IHRoYW5rcywKPiBQaGlsaXBwZSA6LSkKPiBfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwo+IExpbnV4LXN0bTMyIG1haWxpbmcgbGlzdAo+IExp
bnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KPiBodHRwczovL3N0LW1kLW1h
aWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWls
aW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczov
L3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0z
Mgo=
