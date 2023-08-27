Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A80DC78B3A5
	for <lists+linux-stm32@lfdr.de>; Mon, 28 Aug 2023 16:52:15 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 15A88C6B454;
	Mon, 28 Aug 2023 14:52:15 +0000 (UTC)
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com
 [209.85.208.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C1548C65E58
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 27 Aug 2023 09:39:07 +0000 (UTC)
Received: by mail-ed1-f43.google.com with SMTP id
 4fb4d7f45d1cf-529fb04a234so3173898a12.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 27 Aug 2023 02:39:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1693129147; x=1693733947;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:date:from:from:to
 :cc:subject:date:message-id:reply-to;
 bh=qYyzxHypFBZu/5PuZAP2/UcI26Zcil+L0Fz3Xp+pJfs=;
 b=PRj8lZz2kPU20CTQgrwm6OxN3uB9aGl90ghYmA9xlacx3vNPAyu9xPRovJzhp+l03T
 VVoGuXIqMc9LvAO2tjyZmK7yNDC9wcLyhx0jo2RUl27nMIpsSQe+IhS5sQMyPH1d0gLi
 EDnBBERDHxrw/VDkLkT4DoHxYBWYhjKYrzLnGANw2dLTADA4G6/Y0p5Lizwu8ockIj/3
 GRAhqOdLAKY4F/oSh5MWZQA1OcyibCcDwAMJRmh7c87VnI118or4xaYyH7f1BcodaZtO
 874uy5qbkRJ2QRjvojVdRhH6H7z732fwdAwEwSKfrb0ZxLh7HBA9o3uGmLjcGxu40rlY
 eIqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693129147; x=1693733947;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:date:from
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=qYyzxHypFBZu/5PuZAP2/UcI26Zcil+L0Fz3Xp+pJfs=;
 b=TuU8HQTrjrg3C48bugI6/XO+9Ql7an/wwuHLIVO0oYq6iAmeBfWeeXGQK89cbNldUZ
 A5n1MJ55kVzW5jPDqWoA9ZkevY1XHOa4Ojl+yZEwHgOKmcMkNIAPnasscjhGCb3jeJ/u
 5RPiZlhvXUJngROvdMZFj3Rek56d2Lb/QjRGuHHGZyQ4o8Nna7dCQN2PcD2K8sDXWYDh
 to21P6kBVXPpadPQESokmbFY6qjdhSAlZD3JraENjJyV7DzE7AmG9Dm8V5PZM8ruinCd
 4KWso5G0P6WkOuX+kszuMi5dwNUpK9U9/RedU+Y3UbbjT75M4OJCY7UmojGZca0e8qK2
 H4IA==
X-Gm-Message-State: AOJu0YxwGSUN12O9BLSMvtNept+DPSWmHVGbvwfSxNsEpuIHZm8YFZVm
 jIvpP7Ei/B+h54hsqZp5ytc=
X-Google-Smtp-Source: AGHT+IHTC4+PGmt36J8oWvy7QzTwxMbml7C6CiDClOpCdEFZwNhm40K4/mfJtEwA6CRVXVk6ZbNOIQ==
X-Received: by 2002:a17:907:2709:b0:9a1:eb67:c0ce with SMTP id
 w9-20020a170907270900b009a1eb67c0cemr9153281ejk.50.1693129146743; 
 Sun, 27 Aug 2023 02:39:06 -0700 (PDT)
Received: from krava (ip-94-113-247-30.net.vodafone.cz. [94.113.247.30])
 by smtp.gmail.com with ESMTPSA id
 n4-20020a170906688400b0099cf840527csm3206574ejr.153.2023.08.27.02.39.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 27 Aug 2023 02:39:06 -0700 (PDT)
From: Jiri Olsa <olsajiri@gmail.com>
X-Google-Original-From: Jiri Olsa <jolsa@kernel.org>
Date: Sun, 27 Aug 2023 11:39:02 +0200
To: Yafang Shao <laoar.shao@gmail.com>
Message-ID: <ZOsZtjw3NAeMdWfv@krava>
References: <tencent_6D23FE187408D965E95DFAA858BC7E8C760A@qq.com>
 <CALOAHbCXVNXk4WUCRGCDsezzTfieDcLT=Jt00m4UX4zdw=RtsQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CALOAHbCXVNXk4WUCRGCDsezzTfieDcLT=Jt00m4UX4zdw=RtsQ@mail.gmail.com>
X-Mailman-Approved-At: Mon, 28 Aug 2023 14:52:13 +0000
Cc: "open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>,
 John Fastabend <john.fastabend@gmail.com>, Song Liu <song@kernel.org>,
 Rong Tao <rongtao@cestc.cn>, Yonghong Song <yonghong.song@linux.dev>,
 Daniel =?iso-8859-1?Q?M=FCller?= <deso@posteo.net>,
 Rong Tao <rtoax@foxmail.com>, Xu Kuohai <xukuohai@huawei.com>,
 Shuah Khan <shuah@kernel.org>, "moderated list:ARM/STM32 ARCHITECTURE"
 <linux-stm32@st-md-mailman.stormreply.com>, Mykola Lysenko <mykolal@fb.com>,
 Ilya Leoshkevich <iii@linux.ibm.com>, daniel@iogearbox.net,
 Manu Bretelle <chantr4@gmail.com>, andrii@kernel.org,
 Ross Zwisler <zwisler@google.com>, Alexei Starovoitov <ast@kernel.org>,
 KP Singh <kpsingh@kernel.org>, olsajiri@gmail.com,
 "moderated list:ARM/STM32 ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>,
 Hao Luo <haoluo@google.com>, open list <linux-kernel@vger.kernel.org>,
 Eduard Zingerman <eddyz87@gmail.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 "open list:BPF \[GENERAL\] \(Safe Dynamic Programs and Tools\)"
 <bpf@vger.kernel.org>, Martin KaFai Lau <martin.lau@linux.dev>, sdf@google.com
Subject: Re: [Linux-stm32] [PATCH bpf-next v8] selftests/bpf:
 trace_helpers.c: optimize kallsyms cache
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

T24gU3VuLCBBdWcgMjcsIDIwMjMgYXQgMTA6NDg6NDRBTSArMDgwMCwgWWFmYW5nIFNoYW8gd3Jv
dGU6Cj4gT24gU2F0LCBBdWcgMjYsIDIwMjMgYXQgMTA6NDbigK9QTSBSb25nIFRhbyA8cnRvYXhA
Zm94bWFpbC5jb20+IHdyb3RlOgo+ID4KPiA+IEZyb206IFJvbmcgVGFvIDxyb25ndGFvQGNlc3Rj
LmNuPgo+ID4KPiA+IFN0YXRpYyBrc3ltcyBvZnRlbiBoYXZlIHByb2JsZW1zIGJlY2F1c2UgdGhl
IG51bWJlciBvZiBzeW1ib2xzIGV4Y2VlZHMgdGhlCj4gPiBNQVhfU1lNUyBsaW1pdC4gTGlrZSBj
aGFuZ2luZyB0aGUgTUFYX1NZTVMgZnJvbSAzMDAwMDAgdG8gNDAwMDAwIGluCj4gPiBjb21taXQg
ZTc2YTAxNDMzNGE2KCJzZWxmdGVzdHMvYnBmOiBCdW1wIGFuZCB2YWxpZGF0ZSBNQVhfU1lNUyIp
IHNvbHZlcwo+ID4gdGhlIHByb2JsZW0gc29tZXdoYXQsIGJ1dCBpdCdzIG5vdCB0aGUgcGVyZmVj
dCB3YXkuCj4gPgo+ID4gVGhpcyBjb21taXQgdXNlcyBkeW5hbWljIG1lbW9yeSBhbGxvY2F0aW9u
LCB3aGljaCBjb21wbGV0ZWx5IHNvbHZlcyB0aGUKPiA+IHByb2JsZW0gY2F1c2VkIGJ5IHRoZSBs
aW1pdGF0aW9uIG9mIHRoZSBudW1iZXIgb2Yga2FsbHN5bXMuCj4gPgo+ID4gQWNrZWQtYnk6IFN0
YW5pc2xhdiBGb21pY2hldiA8c2RmQGdvb2dsZS5jb20+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBSb25n
IFRhbyA8cm9uZ3Rhb0BjZXN0Yy5jbj4KPiA+IC0tLQo+ID4gdjg6IFJlc29sdmVzIGludGVyLXRo
cmVhZCBjb250ZW50aW9uIGZvciBrc3ltcyBnbG9iYWwgdmFyaWFibGVzLgo+ID4gdjc6IGh0dHBz
Oi8vbG9yZS5rZXJuZWwub3JnL2xrbWwvdGVuY2VudF9CRDZFMTlDMDBCRjU2NUNENUMzNkE5QTBC
RDgyOENGQTIxMEFAcXEuY29tLwo+ID4gICAgIEZpeCBfX211c3RfY2hlY2sgbWFjcm8uCj4gPiB2
NjogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGttbC90ZW5jZW50XzRBMDlBMzZGODgzQTA2RUE0
MjhBNTkzNDk3NjQyQUY4QUYwOEBxcS5jb20vCj4gPiAgICAgQXBwbHkgbGliYnBmX2Vuc3VyZV9t
ZW0oKQo+ID4gdjU6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xrbWwvdGVuY2VudF8wRTlFMUEx
QzA5ODE2NzhENUU3RUE5RTRCREJBOEVFMjIwMEFAcXEuY29tLwo+ID4gICAgIFJlbGVhc2UgdGhl
IGFsbG9jYXRlZCBtZW1vcnkgb25jZSB0aGUgbG9hZF9rYWxsc3ltc19yZWZyZXNoKCkgdXBvbiBl
cnJvcgo+ID4gICAgIGdpdmVuIGl0J3MgZHluYW1pY2FsbHkgYWxsb2NhdGVkLgo+ID4gdjQ6IGh0
dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xrbWwvdGVuY2VudF81OUM3NDYxMzExM0YwQzcyODUyNEIy
QTgyRkU1NTQwQTVFMDlAcXEuY29tLwo+ID4gICAgIE1ha2Ugc3VyZSBtb3N0IGNhc2VzIHdlIGRv
bid0IG5lZWQgdGhlIHJlYWxsb2MoKSBwYXRoIHRvIGJlZ2luIHdpdGgsCj4gPiAgICAgYW5kIGNo
ZWNrIHN0cmR1cCgpIHJldHVybiB2YWx1ZS4KPiA+IHYzOiBodHRwczovL2xvcmUua2VybmVsLm9y
Zy9sa21sL3RlbmNlbnRfNTBCNEIyNjIyRkU3NTQ2QTVGRjk0NjQzMTA2NTBDMDA4NTA5QHFxLmNv
bS8KPiA+ICAgICBEbyBub3QgdXNlIHN0cnVjdHMgYW5kIGp1ZGdlIGtzeW1zX19hZGRfc3ltYm9s
IGZ1bmN0aW9uIHJldHVybiB2YWx1ZS4KPiA+IHYyOiBodHRwczovL2xvcmUua2VybmVsLm9yZy9s
a21sL3RlbmNlbnRfQjY1NUVFNUU1RDQ2MzExMEQ3MENEMjg0NkFCMzI2MkVFRDA5QHFxLmNvbS8K
PiA+ICAgICBEbyB0aGUgdXN1YWwgbGVuL2NhcGFjaXR5IHNjaGVtZSBoZXJlIHRvIGFtb3J0aXpl
IHRoZSBjb3N0IG9mIHJlYWxsb2MsIGFuZAo+ID4gICAgIGRvbid0IGZyZWUgc3ltYm9scy4KPiA+
IHYxOiBodHRwczovL2xvcmUua2VybmVsLm9yZy9sa21sL3RlbmNlbnRfQUI0NjE1MTBCMTBDRDQ4
NEUwQjJGNjJFMzc1NDE2NUYyOTA5QHFxLmNvbS8KPiA+IC0tLQo+ID4gIHNhbXBsZXMvYnBmL01h
a2VmaWxlICAgICAgICAgICAgICAgICAgICAgICAgICB8ICAgNCArCj4gPiAgc2FtcGxlcy9icGYv
b2Zmd2FrZXRpbWVfdXNlci5jICAgICAgICAgICAgICAgIHwgICA3ICstCj4gPiAgc2FtcGxlcy9i
cGYvc2FtcGxlaXBfdXNlci5jICAgICAgICAgICAgICAgICAgIHwgICA5ICstCj4gPiAgc2FtcGxl
cy9icGYvc3BpbnRlc3RfdXNlci5jICAgICAgICAgICAgICAgICAgIHwgICA3ICstCj4gPiAgc2Ft
cGxlcy9icGYvdGFza19mZF9xdWVyeV91c2VyLmMgICAgICAgICAgICAgIHwgIDEzICstCj4gPiAg
c2FtcGxlcy9icGYvdHJhY2VfZXZlbnRfdXNlci5jICAgICAgICAgICAgICAgIHwgICA3ICstCj4g
PiAgLi4uL3NlbGZ0ZXN0cy9icGYvcHJvZ190ZXN0cy9icGZfY29va2llLmMgICAgIHwgICA3ICst
Cj4gPiAgLi4uL3NlbGZ0ZXN0cy9icGYvcHJvZ190ZXN0cy9maWxsX2xpbmtfaW5mby5jIHwgICA5
ICstCj4gPiAgLi4uL2JwZi9wcm9nX3Rlc3RzL2dldF9zdGFja19yYXdfdHAuYyAgICAgICAgIHwg
IDEwICstCj4gPiAgLi4uL2JwZi9wcm9nX3Rlc3RzL2twcm9iZV9tdWx0aV90ZXN0LmMgICAgICAg
IHwgIDEzICstCj4gPiAgLi4uL3Byb2dfdGVzdHMva3Byb2JlX211bHRpX3Rlc3Rtb2RfdGVzdC5j
ICAgIHwgIDEzICstCj4gPiAgdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMvYnBmL3RyYWNlX2hlbHBl
cnMuYyAgIHwgMTE2ICsrKysrKysrKysrKy0tLS0tLQo+ID4gIHRvb2xzL3Rlc3Rpbmcvc2VsZnRl
c3RzL2JwZi90cmFjZV9oZWxwZXJzLmggICB8ICAxMCArLQo+ID4gIDEzIGZpbGVzIGNoYW5nZWQs
IDE1NCBpbnNlcnRpb25zKCspLCA3MSBkZWxldGlvbnMoLSkKPiAKPiBJIHRoaW5rIHdlJ2QgYmV0
dGVyIHNwbGl0IGl0IGludG8gdHdvIHBhdGNoZXM6IG9uZSBmb3Igc2FtcGxlcy9icGYvCj4gYW5k
IGFub3RoZXIgZm9yIHRvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2JwZi4KPiAKPiBCVFcsIHdoeSBj
YW4ndCB3ZSBqdXN0IGxvYWQgaXQgb25jZSBmb3IgYWxsID8gIElPVywgbG9hZCB0aGUga2FsbHN5
bXMKPiBiZWZvcmUgd2Ugc3RhcnQgZWFjaCBpbmRpdmlkdWFsIHRlc3QsIGFuZCBmcmVlIGl0IGFm
dGVyIGFsbCB0ZXN0cwo+IGZpbmlzaC4KCnRoZXJlIGFyZSBicGZfdGVzdG1vZCB0ZXN0cyB0aGF0
IHVubG9hZCBtb2R1bGUgc28gd2UgbmVlZCBmcmVzaApzeW1ib2xzIGFmdGVyIHRoYXQKCmppcmth
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0
bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29t
Cmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LXN0bTMyCg==
