Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 511FC78B3A4
	for <lists+linux-stm32@lfdr.de>; Mon, 28 Aug 2023 16:52:15 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0140AC6B44F;
	Mon, 28 Aug 2023 14:52:15 +0000 (UTC)
Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com
 [209.85.219.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AF0EDC6B44E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 27 Aug 2023 02:49:21 +0000 (UTC)
Received: by mail-qv1-f53.google.com with SMTP id
 6a1803df08f44-6515d44b562so822316d6.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 26 Aug 2023 19:49:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1693104560; x=1693709360;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NCtnF9exppXJ6XEDIDPLdkpvn2zVvtmJBQygM/RMB4o=;
 b=rAb2DkGtLtzvfBusGnyMbSTNQITIVKXuVi/834VnyW/8qP/QrdR+zwzLXjW4G9cS16
 L80aJ8eBncSsGnLp7m/BIHTC5J29pNaiHgxMoR63mUkPSC22edCqtzExg7KRNeWcAehg
 OWJXkDDMnjjzC/hb1xk9BRhuweSCXFoKMDSCQd/J+uMbKJCIo1sQPlwhhVKV0w2ixnL0
 hW1HNfiSNNB1q/D2ClEburhGBGvUq2BcPhH0Zptmb08IPwI1fEO5jqOYLXRNZRY4zMD0
 DeDqHTcMiKiXQl5hWxDOVcXsRbkOeeOOn4QWHYmYOeYaY0Z6zaHzDvurKz+p7KR06RUk
 BLww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693104560; x=1693709360;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NCtnF9exppXJ6XEDIDPLdkpvn2zVvtmJBQygM/RMB4o=;
 b=MmCrDPWZMYOa26GWCKw9QyuW76I1djWD+DOTEJ09qMTb2dFUxcpEPMBCifkEHpiz/a
 le8GMlC5vqnL6sM166Xiav2cQYJH/oD1eFu/fR6ADI51ugQqFr0SKatnzLMyjC9EFt4W
 fT4rFwjTMxSV3irDtAQaOtEYVKc+ndvnkkAQpsc67O+4yY8Iv6XAt96xUgCvR6iY9fDe
 4N6yudu2321cn17gO2zyy6gh7etJd/f0RvAq/OKN91IzJE48Qm6+op3gr3ThM0+wvnZz
 X4wmybijEoYVRu7KbfnZV+5Xn/8EJa75j00//LYTw6ECjq9Dn5olP0UC8TpPKKbUm9XY
 CH5w==
X-Gm-Message-State: AOJu0YyY1YwMgqi+OukDkzqVFySHE1dxtCgYG1DBd+Aukg9sCAgIwB1n
 /bCs35dfW0S7VHdPhKRWxP2u3qppSOjLCa20zT4=
X-Google-Smtp-Source: AGHT+IF4vkWOe6NkflE5M3y8AVEnYVu/enyv10HrjdIye1KfASXGZWMrI8GglN7QOaOkABkqbpataQrmDhg3E7fucmo=
X-Received: by 2002:a05:6214:4111:b0:649:bf3:6dbe with SMTP id
 kc17-20020a056214411100b006490bf36dbemr27581212qvb.62.1693104560582; Sat, 26
 Aug 2023 19:49:20 -0700 (PDT)
MIME-Version: 1.0
References: <tencent_6D23FE187408D965E95DFAA858BC7E8C760A@qq.com>
In-Reply-To: <tencent_6D23FE187408D965E95DFAA858BC7E8C760A@qq.com>
From: Yafang Shao <laoar.shao@gmail.com>
Date: Sun, 27 Aug 2023 10:48:44 +0800
Message-ID: <CALOAHbCXVNXk4WUCRGCDsezzTfieDcLT=Jt00m4UX4zdw=RtsQ@mail.gmail.com>
To: Rong Tao <rtoax@foxmail.com>
X-Mailman-Approved-At: Mon, 28 Aug 2023 14:52:13 +0000
Cc: "open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>,
 John Fastabend <john.fastabend@gmail.com>, Song Liu <song@kernel.org>,
 Rong Tao <rongtao@cestc.cn>, Yonghong Song <yonghong.song@linux.dev>,
 =?UTF-8?Q?Daniel_M=C3=BCller?= <deso@posteo.net>,
 Xu Kuohai <xukuohai@huawei.com>, Shuah Khan <shuah@kernel.org>,
 "moderated list:ARM/STM32 ARCHITECTURE"
 <linux-stm32@st-md-mailman.stormreply.com>, Mykola Lysenko <mykolal@fb.com>,
 Ilya Leoshkevich <iii@linux.ibm.com>, daniel@iogearbox.net,
 Manu Bretelle <chantr4@gmail.com>, andrii@kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Ross Zwisler <zwisler@google.com>,
 Alexei Starovoitov <ast@kernel.org>, KP Singh <kpsingh@kernel.org>,
 olsajiri@gmail.com,
 "moderated list:ARM/STM32 ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>,
 Hao Luo <haoluo@google.com>, open list <linux-kernel@vger.kernel.org>,
 Eduard Zingerman <eddyz87@gmail.com>, Jiri Olsa <jolsa@kernel.org>,
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

T24gU2F0LCBBdWcgMjYsIDIwMjMgYXQgMTA6NDbigK9QTSBSb25nIFRhbyA8cnRvYXhAZm94bWFp
bC5jb20+IHdyb3RlOgo+Cj4gRnJvbTogUm9uZyBUYW8gPHJvbmd0YW9AY2VzdGMuY24+Cj4KPiBT
dGF0aWMga3N5bXMgb2Z0ZW4gaGF2ZSBwcm9ibGVtcyBiZWNhdXNlIHRoZSBudW1iZXIgb2Ygc3lt
Ym9scyBleGNlZWRzIHRoZQo+IE1BWF9TWU1TIGxpbWl0LiBMaWtlIGNoYW5naW5nIHRoZSBNQVhf
U1lNUyBmcm9tIDMwMDAwMCB0byA0MDAwMDAgaW4KPiBjb21taXQgZTc2YTAxNDMzNGE2KCJzZWxm
dGVzdHMvYnBmOiBCdW1wIGFuZCB2YWxpZGF0ZSBNQVhfU1lNUyIpIHNvbHZlcwo+IHRoZSBwcm9i
bGVtIHNvbWV3aGF0LCBidXQgaXQncyBub3QgdGhlIHBlcmZlY3Qgd2F5Lgo+Cj4gVGhpcyBjb21t
aXQgdXNlcyBkeW5hbWljIG1lbW9yeSBhbGxvY2F0aW9uLCB3aGljaCBjb21wbGV0ZWx5IHNvbHZl
cyB0aGUKPiBwcm9ibGVtIGNhdXNlZCBieSB0aGUgbGltaXRhdGlvbiBvZiB0aGUgbnVtYmVyIG9m
IGthbGxzeW1zLgo+Cj4gQWNrZWQtYnk6IFN0YW5pc2xhdiBGb21pY2hldiA8c2RmQGdvb2dsZS5j
b20+Cj4gU2lnbmVkLW9mZi1ieTogUm9uZyBUYW8gPHJvbmd0YW9AY2VzdGMuY24+Cj4gLS0tCj4g
djg6IFJlc29sdmVzIGludGVyLXRocmVhZCBjb250ZW50aW9uIGZvciBrc3ltcyBnbG9iYWwgdmFy
aWFibGVzLgo+IHY3OiBodHRwczovL2xvcmUua2VybmVsLm9yZy9sa21sL3RlbmNlbnRfQkQ2RTE5
QzAwQkY1NjVDRDVDMzZBOUEwQkQ4MjhDRkEyMTBBQHFxLmNvbS8KPiAgICAgRml4IF9fbXVzdF9j
aGVjayBtYWNyby4KPiB2NjogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGttbC90ZW5jZW50XzRB
MDlBMzZGODgzQTA2RUE0MjhBNTkzNDk3NjQyQUY4QUYwOEBxcS5jb20vCj4gICAgIEFwcGx5IGxp
YmJwZl9lbnN1cmVfbWVtKCkKPiB2NTogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGttbC90ZW5j
ZW50XzBFOUUxQTFDMDk4MTY3OEQ1RTdFQTlFNEJEQkE4RUUyMjAwQUBxcS5jb20vCj4gICAgIFJl
bGVhc2UgdGhlIGFsbG9jYXRlZCBtZW1vcnkgb25jZSB0aGUgbG9hZF9rYWxsc3ltc19yZWZyZXNo
KCkgdXBvbiBlcnJvcgo+ICAgICBnaXZlbiBpdCdzIGR5bmFtaWNhbGx5IGFsbG9jYXRlZC4KPiB2
NDogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGttbC90ZW5jZW50XzU5Qzc0NjEzMTEzRjBDNzI4
NTI0QjJBODJGRTU1NDBBNUUwOUBxcS5jb20vCj4gICAgIE1ha2Ugc3VyZSBtb3N0IGNhc2VzIHdl
IGRvbid0IG5lZWQgdGhlIHJlYWxsb2MoKSBwYXRoIHRvIGJlZ2luIHdpdGgsCj4gICAgIGFuZCBj
aGVjayBzdHJkdXAoKSByZXR1cm4gdmFsdWUuCj4gdjM6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3Jn
L2xrbWwvdGVuY2VudF81MEI0QjI2MjJGRTc1NDZBNUZGOTQ2NDMxMDY1MEMwMDg1MDlAcXEuY29t
Lwo+ICAgICBEbyBub3QgdXNlIHN0cnVjdHMgYW5kIGp1ZGdlIGtzeW1zX19hZGRfc3ltYm9sIGZ1
bmN0aW9uIHJldHVybiB2YWx1ZS4KPiB2MjogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGttbC90
ZW5jZW50X0I2NTVFRTVFNUQ0NjMxMTBENzBDRDI4NDZBQjMyNjJFRUQwOUBxcS5jb20vCj4gICAg
IERvIHRoZSB1c3VhbCBsZW4vY2FwYWNpdHkgc2NoZW1lIGhlcmUgdG8gYW1vcnRpemUgdGhlIGNv
c3Qgb2YgcmVhbGxvYywgYW5kCj4gICAgIGRvbid0IGZyZWUgc3ltYm9scy4KPiB2MTogaHR0cHM6
Ly9sb3JlLmtlcm5lbC5vcmcvbGttbC90ZW5jZW50X0FCNDYxNTEwQjEwQ0Q0ODRFMEIyRjYyRTM3
NTQxNjVGMjkwOUBxcS5jb20vCj4gLS0tCj4gIHNhbXBsZXMvYnBmL01ha2VmaWxlICAgICAgICAg
ICAgICAgICAgICAgICAgICB8ICAgNCArCj4gIHNhbXBsZXMvYnBmL29mZndha2V0aW1lX3VzZXIu
YyAgICAgICAgICAgICAgICB8ICAgNyArLQo+ICBzYW1wbGVzL2JwZi9zYW1wbGVpcF91c2VyLmMg
ICAgICAgICAgICAgICAgICAgfCAgIDkgKy0KPiAgc2FtcGxlcy9icGYvc3BpbnRlc3RfdXNlci5j
ICAgICAgICAgICAgICAgICAgIHwgICA3ICstCj4gIHNhbXBsZXMvYnBmL3Rhc2tfZmRfcXVlcnlf
dXNlci5jICAgICAgICAgICAgICB8ICAxMyArLQo+ICBzYW1wbGVzL2JwZi90cmFjZV9ldmVudF91
c2VyLmMgICAgICAgICAgICAgICAgfCAgIDcgKy0KPiAgLi4uL3NlbGZ0ZXN0cy9icGYvcHJvZ190
ZXN0cy9icGZfY29va2llLmMgICAgIHwgICA3ICstCj4gIC4uLi9zZWxmdGVzdHMvYnBmL3Byb2df
dGVzdHMvZmlsbF9saW5rX2luZm8uYyB8ICAgOSArLQo+ICAuLi4vYnBmL3Byb2dfdGVzdHMvZ2V0
X3N0YWNrX3Jhd190cC5jICAgICAgICAgfCAgMTAgKy0KPiAgLi4uL2JwZi9wcm9nX3Rlc3RzL2tw
cm9iZV9tdWx0aV90ZXN0LmMgICAgICAgIHwgIDEzICstCj4gIC4uLi9wcm9nX3Rlc3RzL2twcm9i
ZV9tdWx0aV90ZXN0bW9kX3Rlc3QuYyAgICB8ICAxMyArLQo+ICB0b29scy90ZXN0aW5nL3NlbGZ0
ZXN0cy9icGYvdHJhY2VfaGVscGVycy5jICAgfCAxMTYgKysrKysrKysrKysrLS0tLS0tCj4gIHRv
b2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2JwZi90cmFjZV9oZWxwZXJzLmggICB8ICAxMCArLQo+ICAx
MyBmaWxlcyBjaGFuZ2VkLCAxNTQgaW5zZXJ0aW9ucygrKSwgNzEgZGVsZXRpb25zKC0pCgpJIHRo
aW5rIHdlJ2QgYmV0dGVyIHNwbGl0IGl0IGludG8gdHdvIHBhdGNoZXM6IG9uZSBmb3Igc2FtcGxl
cy9icGYvCmFuZCBhbm90aGVyIGZvciB0b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9icGYuCgpCVFcs
IHdoeSBjYW4ndCB3ZSBqdXN0IGxvYWQgaXQgb25jZSBmb3IgYWxsID8gIElPVywgbG9hZCB0aGUg
a2FsbHN5bXMKYmVmb3JlIHdlIHN0YXJ0IGVhY2ggaW5kaXZpZHVhbCB0ZXN0LCBhbmQgZnJlZSBp
dCBhZnRlciBhbGwgdGVzdHMKZmluaXNoLgoKLS0gClJlZ2FyZHMKWWFmYW5nCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcg
bGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3Qt
bWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
