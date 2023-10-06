Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 79D187BBEF3
	for <lists+linux-stm32@lfdr.de>; Fri,  6 Oct 2023 20:49:44 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2F912C6A613;
	Fri,  6 Oct 2023 18:49:44 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com
 [209.85.128.45])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8246EC62EFE
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  6 Oct 2023 18:49:43 +0000 (UTC)
Received: by mail-wm1-f45.google.com with SMTP id
 5b1f17b1804b1-40566f89f6eso23567515e9.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 06 Oct 2023 11:49:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1696618183; x=1697222983;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:subject:cc:to:from:date:message-id:from:to
 :cc:subject:date:message-id:reply-to;
 bh=J8TnZukIluCCYT6M1BV1r+HvisyoMBi+KKDF01G+Mhg=;
 b=dalFUPdDgJRzTxxctrJPS9dPZ3JWUCLV3jWQ3SPAZ94e1K85NqBavyCI0kOlzzOSYg
 RNF6XAqRXn6DDPjNlvRgA3Yr9jztJ8UuEsfLc358X9ZpwLDFzUg2aJad8yzMf8cCM05u
 8xYRnBb7LzU82dXgaZMAwzou+7+0IKAsCLLaB88vsE9SQcJC6/8YLdWRiTXraFawg9ia
 jmv5dgPRmEJO1CvrLpOpvbt0OIiMI9vg97yuzyIJ0bnLX4SyvyMC0K/0a5HJESQt6EDW
 mOVcGZ16OHmtpf6g+aVrv7jZNSXB9Nl6QAXal/7nWQMOQnh7rttX0PHJ21QE6IkfJ/ne
 Mezw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696618183; x=1697222983;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:subject:cc:to:from:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=J8TnZukIluCCYT6M1BV1r+HvisyoMBi+KKDF01G+Mhg=;
 b=iJ/2WOl03D/L0xsPTCyzb8BooNtB9VlRq2OE9LG97ys6psjvkRzBbSvvqY0yM4CDoE
 tahLcjF09IJnPRcotFYKe2D+xzoW4Gny9DGngNQbZh1Npj7KZZz0zOaVUt7RcFPBMXFC
 0AXEuqV94hVqq4WwNFgkAnJlEkHbNosQ3+SNEIYmqPKbOeAH83HHLyxAMF/oGodHNKWu
 tJdGT5KGJ2bBIdhe0dfzX07t+ToVoOwpCsn0dE53gxrXU8TbAdRE6Ua0jqfVxc5qy8Sf
 M1w/a8enlALdJro77WxJBY9lEv3ObITpO4Me4xLL4qBdnapoZyIpEU8Z6cpYIObnh8cU
 KDDQ==
X-Gm-Message-State: AOJu0YzM7vZ5rkfPZq5FGYfPWQFVEVfK0xAwBa0LDRv3OIv/29aubyie
 kVdXXJZ0j7qWYavglVqOmGA=
X-Google-Smtp-Source: AGHT+IGnyXDNMYk8HFRpUEcTSZlI2oSIFcmKPz3Tef9zJ6V0zvxO56KtfzCWQ2oyr2OO4KuUJibc4g==
X-Received: by 2002:a05:6000:48:b0:31f:f8a5:15db with SMTP id
 k8-20020a056000004800b0031ff8a515dbmr8155280wrx.48.1696618182580; 
 Fri, 06 Oct 2023 11:49:42 -0700 (PDT)
Received: from Ansuel-xps. (93-34-89-13.ip49.fastwebnet.it. [93.34.89.13])
 by smtp.gmail.com with ESMTPSA id
 p4-20020a5d68c4000000b003232f167df5sm2217218wrw.108.2023.10.06.11.49.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Oct 2023 11:49:41 -0700 (PDT)
Message-ID: <652056c5.5d0a0220.2b60d.c5dc@mx.google.com>
X-Google-Original-Message-ID: <ZSBWxW8ba8P0szfD@Ansuel-xps.>
Date: Fri, 6 Oct 2023 20:49:41 +0200
From: Christian Marangi <ansuelsmth@gmail.com>
To: Eric Dumazet <edumazet@google.com>
References: <20231003145150.2498-1-ansuelsmth@gmail.com>
 <20231003145150.2498-4-ansuelsmth@gmail.com>
 <CANn89iLtYZJPOQE7OkAbEdmhT8qjzAJ+27poa__3c8Nf0M6u_w@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CANn89iLtYZJPOQE7OkAbEdmhT8qjzAJ+27poa__3c8Nf0M6u_w@mail.gmail.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Sergey Ryazanov <ryazanov.s.a@gmail.com>,
 Ziwei Xiao <ziweixiao@google.com>, Chris Snook <chris.snook@gmail.com>,
 Rick Lindsley <ricklind@linux.ibm.com>, Krzysztof Halasa <khalasa@piap.pl>,
 Yuri Karpov <YKarpov@ispras.ru>, netdev@vger.kernel.org,
 ath10k@lists.infradead.org, Dany Madden <danymadden@us.ibm.com>,
 Gregory Greenman <gregory.greenman@intel.com>,
 Zhengchao Shao <shaozhengchao@huawei.com>,
 Chiranjeevi Rapolu <chiranjeevi.rapolu@linux.intel.com>,
 Dawei Li <set_pte_at@outlook.com>, Intel Corporation <linuxwwan@intel.com>,
 Rob Herring <robh@kernel.org>, Jeroen de Borst <jeroendb@google.com>,
 Leon Romanovsky <leon@kernel.org>, linux-rdma@vger.kernel.org,
 Michael Ellerman <mpe@ellerman.id.au>, Lee Jones <lee@kernel.org>,
 Haren Myneni <haren@linux.ibm.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 linux-stm32@st-md-mailman.stormreply.com, Rushil Gupta <rushilg@google.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, Thomas Falcon <tlfalcon@linux.ibm.com>,
 Jose Abreu <joabreu@synopsys.com>,
 Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
 linux-wireless@vger.kernel.org, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Wei Fang <wei.fang@nxp.com>,
 Wolfgang Grandegger <wg@grandegger.com>, Nick Child <nnac123@linux.ibm.com>,
 Simon Horman <horms@kernel.org>, Liu Haijun <haijun.liu@mediatek.com>,
 Kalle Valo <kvalo@kernel.org>, linuxppc-dev@lists.ozlabs.org,
 Nicholas Piggin <npiggin@gmail.com>, linux-can@vger.kernel.org,
 Yuanjun Gong <ruc_gongyuanjun@163.com>, Shailend Chand <shailend@google.com>,
 Marc Kleine-Budde <mkl@pengutronix.de>,
 Benjamin Berg <benjamin.berg@intel.com>,
 M Chetan Kumar <m.chetan.kumar@linux.intel.com>,
 Thomas Gleixner <tglx@linutronix.de>, Coco Li <lixiaoyan@google.com>,
 linux-arm-kernel@lists.infradead.org,
 Chandrashekar Devegowda <chandrashekar.devegowda@intel.com>,
 Ricardo Martinez <ricardo.martinez@linux.intel.com>,
 Loic Poulain <loic.poulain@linaro.org>,
 Zheng Zengkai <zhengzengkai@huawei.com>,
 Maximilian Luz <luzmaximilian@gmail.com>,
 Anjaneyulu <pagadala.yesu.anjaneyulu@intel.com>,
 "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
 Douglas Miller <dougmill@linux.ibm.com>, linux-kernel@vger.kernel.org,
 Tariq Toukan <tariqt@nvidia.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Junfeng Guo <junfeng.guo@intel.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Raju Rangoju <rajur@chelsio.com>,
 Praveen Kaligineedi <pkaligineedi@google.com>,
 Johannes Berg <johannes@sipsolutions.net>,
 Jeff Johnson <quic_jjohnson@quicinc.com>,
 "David S. Miller" <davem@davemloft.net>
Subject: Re: [Linux-stm32] [net-next PATCH v2 4/4] netdev: use napi_schedule
 bool instead of napi_schedule_prep/__napi_schedule
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

T24gVGh1LCBPY3QgMDUsIDIwMjMgYXQgMDY6MTY6MjZQTSArMDIwMCwgRXJpYyBEdW1hemV0IHdy
b3RlOgo+IE9uIFR1ZSwgT2N0IDMsIDIwMjMgYXQgODozNuKAr1BNIENocmlzdGlhbiBNYXJhbmdp
IDxhbnN1ZWxzbXRoQGdtYWlsLmNvbT4gd3JvdGU6Cj4gPgo+ID4gUmVwbGFjZSBpZiBjb25kaXRp
b24gb2YgbmFwaV9zY2hlZHVsZV9wcmVwL19fbmFwaV9zY2hlZHVsZSBhbmQgdXNlIGJvb2wKPiA+
IGZyb20gbmFwaV9zY2hlZHVsZSBkaXJlY3RseSB3aGVyZSBwb3NzaWJsZS4KPiA+Cj4gPiBTaWdu
ZWQtb2ZmLWJ5OiBDaHJpc3RpYW4gTWFyYW5naSA8YW5zdWVsc210aEBnbWFpbC5jb20+Cj4gPiAt
LS0KPiA+ICBkcml2ZXJzL25ldC9ldGhlcm5ldC9hdGhlcm9zL2F0bHgvYXRsMS5jICAgICB8IDQg
Ky0tLQo+ID4gIGRyaXZlcnMvbmV0L2V0aGVybmV0L3Rvc2hpYmEvdGMzNTgxNS5jICAgICAgIHwg
NCArLS0tCj4gPiAgZHJpdmVycy9uZXQvd2lyZWxlc3MvaW50ZWwvaXdsd2lmaS9wY2llL3J4LmMg
fCA0ICstLS0KPiA+ICAzIGZpbGVzIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgOSBkZWxldGlv
bnMoLSkKPiA+Cj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9uZXQvZXRoZXJuZXQvYXRoZXJvcy9h
dGx4L2F0bDEuYyBiL2RyaXZlcnMvbmV0L2V0aGVybmV0L2F0aGVyb3MvYXRseC9hdGwxLmMKPiA+
IGluZGV4IDAyYWE2ZmQ4ZWJjMi4uYTkwMTRkNzkzMmRiIDEwMDY0NAo+ID4gLS0tIGEvZHJpdmVy
cy9uZXQvZXRoZXJuZXQvYXRoZXJvcy9hdGx4L2F0bDEuYwo+ID4gKysrIGIvZHJpdmVycy9uZXQv
ZXRoZXJuZXQvYXRoZXJvcy9hdGx4L2F0bDEuYwo+ID4gQEAgLTI0NDYsNyArMjQ0Niw3IEBAIHN0
YXRpYyBpbnQgYXRsMV9yaW5nc19jbGVhbihzdHJ1Y3QgbmFwaV9zdHJ1Y3QgKm5hcGksIGludCBi
dWRnZXQpCj4gPgo+ID4gIHN0YXRpYyBpbmxpbmUgaW50IGF0bDFfc2NoZWRfcmluZ3NfY2xlYW4o
c3RydWN0IGF0bDFfYWRhcHRlciogYWRhcHRlcikKPiA+ICB7Cj4gPiAtICAgICAgIGlmICghbmFw
aV9zY2hlZHVsZV9wcmVwKCZhZGFwdGVyLT5uYXBpKSkKPiA+ICsgICAgICAgaWYgKCFuYXBpX3Nj
aGVkdWxlKCZhZGFwdGVyLT5uYXBpKSkKPiA+ICAgICAgICAgICAgICAgICAvKiBJdCBpcyBwb3Nz
aWJsZSBpbiBjYXNlIGV2ZW4gdGhlIFJYL1RYIGludHMgYXJlIGRpc2FibGVkIHZpYSBJTVIKPiA+
ICAgICAgICAgICAgICAgICAgKiByZWdpc3RlciB0aGUgSVNSIGJpdHMgYXJlIHNldCBhbnl3YXkg
KGJ1dCBkbyBub3QgcHJvZHVjZSBJUlEpLgo+ID4gICAgICAgICAgICAgICAgICAqIFRvIGhhbmRs
ZSBzdWNoIHNpdHVhdGlvbiB0aGUgbmFwaSBmdW5jdGlvbnMgdXNlZCB0byBjaGVjayBpcwo+ID4g
QEAgLTI0NTQsOCArMjQ1NCw2IEBAIHN0YXRpYyBpbmxpbmUgaW50IGF0bDFfc2NoZWRfcmluZ3Nf
Y2xlYW4oc3RydWN0IGF0bDFfYWRhcHRlciogYWRhcHRlcikKPiA+ICAgICAgICAgICAgICAgICAg
Ki8KPiA+ICAgICAgICAgICAgICAgICByZXR1cm4gMDsKPiA+Cj4gPiAtICAgICAgIF9fbmFwaV9z
Y2hlZHVsZSgmYWRhcHRlci0+bmFwaSk7Cj4gPiAtCj4gPiAgICAgICAgIC8qCj4gPiAgICAgICAg
ICAqIERpc2FibGUgUlgvVFggaW50cyB2aWEgSU1SIHJlZ2lzdGVyIGlmIGl0IGlzCj4gPiAgICAg
ICAgICAqIGFsbG93ZWQuIE5BUEkgaGFuZGxlciBtdXN0IHJlZW5hYmxlIHRoZW0gaW4gc2FtZQo+
ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbmV0L2V0aGVybmV0L3Rvc2hpYmEvdGMzNTgxNS5jIGIv
ZHJpdmVycy9uZXQvZXRoZXJuZXQvdG9zaGliYS90YzM1ODE1LmMKPiA+IGluZGV4IDE0Y2Y2ZWNm
NmQwZC4uYThiOGEwZTEzZjlhIDEwMDY0NAo+ID4gLS0tIGEvZHJpdmVycy9uZXQvZXRoZXJuZXQv
dG9zaGliYS90YzM1ODE1LmMKPiA+ICsrKyBiL2RyaXZlcnMvbmV0L2V0aGVybmV0L3Rvc2hpYmEv
dGMzNTgxNS5jCj4gPiBAQCAtMTQzNiw5ICsxNDM2LDcgQEAgc3RhdGljIGlycXJldHVybl90IHRj
MzU4MTVfaW50ZXJydXB0KGludCBpcnEsIHZvaWQgKmRldl9pZCkKPiA+ICAgICAgICAgaWYgKCEo
ZG1hY3RsICYgRE1BX0ludE1hc2spKSB7Cj4gPiAgICAgICAgICAgICAgICAgLyogZGlzYWJsZSBp
bnRlcnJ1cHRzICovCj4gPiAgICAgICAgICAgICAgICAgdGNfd3JpdGVsKGRtYWN0bCB8IERNQV9J
bnRNYXNrLCAmdHItPkRNQV9DdGwpOwo+ID4gLSAgICAgICAgICAgICAgIGlmIChuYXBpX3NjaGVk
dWxlX3ByZXAoJmxwLT5uYXBpKSkKPiA+IC0gICAgICAgICAgICAgICAgICAgICAgIF9fbmFwaV9z
Y2hlZHVsZSgmbHAtPm5hcGkpOwo+ID4gLSAgICAgICAgICAgICAgIGVsc2Ugewo+ID4gKyAgICAg
ICAgICAgICAgIGlmICghbmFwaV9zY2hlZHVsZSgmbHAtPm5hcGkpKSB7Cj4gPiAgICAgICAgICAg
ICAgICAgICAgICAgICBwcmludGsoS0VSTl9FUlIgIiVzOiBpbnRlcnJ1cHQgdGFrZW4gaW4gcG9s
bFxuIiwKPiA+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBkZXYtPm5hbWUpOwo+ID4g
ICAgICAgICAgICAgICAgICAgICAgICAgQlVHKCk7Cj4gCj4gSG1tbS4uLiBjb3VsZCB5b3UgYWxz
byByZW1vdmUgdGhpcyBCVUcoKSA/IEkgdGhpbmsgdGhpcyBjb2RlIHBhdGggY2FuIGJlIHRha2Vu
Cj4gaWYgc29tZSBhcHBsaWNhdGlvbnMgYXJlIHVzaW5nIGJ1c3kgcG9sbGluZy4KPiAKPiBPciBz
aW1wbHkgcmV3cml0ZSB0aGlzIHdpdGggdGhlIHRyYWRpdGlvbmFsCj4gCj4gaWYgKG5hcGlfc2No
ZWR1bGVfcHJlcCgmbHAtPm5hcGkpKSB7Cj4gICAgLyogZGlzYWJsZSBpbnRlcnJ1cHRzICovCj4g
ICAgdGNfd3JpdGVsKGRtYWN0bCB8IERNQV9JbnRNYXNrLCAmdHItPkRNQV9DdGwpOwo+ICAgICBf
X25hcGlfc2NoZWR1bGUoJmxwLT5uYXBpKTsKPiB9Cj4gCj4KCk1oaGggaXMgaXQgc2FmZSB0byBk
byBzbz8gSSBtZWFuIGl0IHNlZW1zIHZlcnkgd3JvbmcgdG8gcHJpbnQgYSB3YXJuaW5nCmFuZCBC
VUcoKSBpbnN0ZWFkIG9mIGRpc2FibGluZyB0aGUgaW50ZXJydXB0IG9ubHkgaWYgbmFwaSBjYW4g
YmUKc2NoZWR1bGVkLi4uIE1heWJlIGlzIHZlcnkgb2xkIGNvZGU/IFRoZSBtb3JlIEkgc2VlIHRo
aXMgdGhlIG1vcmUgSSBzZWUKcHJvYmxlbS4uLiAocmFuZG9tbHkgZGlzYWJsaW5nIHRoZSBpbnRl
cnJ1cHQgYW5kIHRoZW4gbWFrZSB0aGUga2VybmVsCmRpZSkKCj4gCj4gPiBkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9uZXQvd2lyZWxlc3MvaW50ZWwvaXdsd2lmaS9wY2llL3J4LmMgYi9kcml2ZXJzL25l
dC93aXJlbGVzcy9pbnRlbC9pd2x3aWZpL3BjaWUvcnguYwo+ID4gaW5kZXggMjNiNWEwYWRjYmQ2
Li4xNDZiYzdiZDE0ZmIgMTAwNjQ0Cj4gPiAtLS0gYS9kcml2ZXJzL25ldC93aXJlbGVzcy9pbnRl
bC9pd2x3aWZpL3BjaWUvcnguYwo+ID4gKysrIGIvZHJpdmVycy9uZXQvd2lyZWxlc3MvaW50ZWwv
aXdsd2lmaS9wY2llL3J4LmMKPiA+IEBAIC0xNjYwLDkgKzE2NjAsNyBAQCBpcnFyZXR1cm5fdCBp
d2xfcGNpZV9pcnFfcnhfbXNpeF9oYW5kbGVyKGludCBpcnEsIHZvaWQgKmRldl9pZCkKPiA+ICAg
ICAgICAgSVdMX0RFQlVHX0lTUih0cmFucywgIlslZF0gR290IGludGVycnVwdFxuIiwgZW50cnkt
PmVudHJ5KTsKPiA+Cj4gPiAgICAgICAgIGxvY2FsX2JoX2Rpc2FibGUoKTsKPiA+IC0gICAgICAg
aWYgKG5hcGlfc2NoZWR1bGVfcHJlcCgmcnhxLT5uYXBpKSkKPiA+IC0gICAgICAgICAgICAgICBf
X25hcGlfc2NoZWR1bGUoJnJ4cS0+bmFwaSk7Cj4gPiAtICAgICAgIGVsc2UKPiA+ICsgICAgICAg
aWYgKCFuYXBpX3NjaGVkdWxlKCZyeHEtPm5hcGkpKQo+ID4gICAgICAgICAgICAgICAgIGl3bF9w
Y2llX2NsZWFyX2lycSh0cmFucywgZW50cnktPmVudHJ5KTsKPiAKPiBTYW1lIHJlbWFyayBoZXJl
IGFib3V0IHR3aXN0ZWQgbG9naWMuCj4gCgpFaGhoIGhlcmUgd2UgbmVlZCB0byBiZSBjYXJlZnVs
Li4uIFdlIGNhbiBkbyB0aGUgdXN1YWwgcHJlcC9fX3NjaGVkdWxlCndpdGggdGhlIERNQSBkaXNh
YmxlIGluIGJldHdlZW4uLi4KCkZyb20gdGhlIGNvbW1lbnRzIG9mIGl3bF9wY2llX2NsZWFyX2ly
cS4KCgkvKgoJICogQmVmb3JlIHNlbmRpbmcgdGhlIGludGVycnVwdCB0aGUgSFcgZGlzYWJsZXMg
aXQgdG8gcHJldmVudAoJICogYSBuZXN0ZWQgaW50ZXJydXB0LiBUaGlzIGlzIGRvbmUgYnkgd3Jp
dGluZyAxIHRvIHRoZSBjb3JyZXNwb25kaW5nCgkgKiBiaXQgaW4gdGhlIG1hc2sgcmVnaXN0ZXIu
IEFmdGVyIGhhbmRsaW5nIHRoZSBpbnRlcnJ1cHQsIGl0IHNob3VsZCBiZQoJICogcmUtZW5hYmxl
ZCBieSBjbGVhcmluZyB0aGlzIGJpdC4gVGhpcyByZWdpc3RlciBpcyBkZWZpbmVkIGFzCgkgKiB3
cml0ZSAxIGNsZWFyIChXMUMpIHJlZ2lzdGVyLCBtZWFuaW5nIHRoYXQgaXQncyBiZWluZyBjbGVh
cgoJICogYnkgd3JpdGluZyAxIHRvIHRoZSBiaXQuCgkgKi8KClNvIHRoZSBkZXZpY2UgZGlzYWJs
ZSB0aGUgaW50ZXJydXB0IGFmdGVyIGJlaW5nIGZpcmVkIGFuZCB0aGUgYml0IG5lZWRzCnRvIHNl
dCBhZ2FpbiBmb3IgdGhlIGludGVycnVwdCB0byBiZSByZWVuYWJsZWQuIFNvIHRoZSBmdW5jdGlv
bgpjb3JyZWN0bHkgcmVlbmFibGUgdGhlIGlycSBpZiBhIG5hcGkgY2FuJ3QgYmUgc2NoZWR1bGVk
Li4uIFRoaW5rIHRoZXJlCmlzbid0IGFub3RoZXIgd2F5IHRvIGhhbmRsZSB0aGlzLgoKPiA+ICAg
ICAgICAgbG9jYWxfYmhfZW5hYmxlKCk7Cj4gPgo+ID4gLS0KPiA+IDIuNDAuMQo+ID4KCi0tIAoJ
QW5zdWVsCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxp
bnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVw
bHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LXN0bTMyCg==
