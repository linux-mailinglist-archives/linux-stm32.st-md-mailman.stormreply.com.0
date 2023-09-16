Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 969877A3134
	for <lists+linux-stm32@lfdr.de>; Sat, 16 Sep 2023 17:47:49 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 44DA4C6A5EF;
	Sat, 16 Sep 2023 15:47:49 +0000 (UTC)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7BF55C62EFE
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 16 Sep 2023 15:47:47 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 1C7C2CE2F28;
 Sat, 16 Sep 2023 15:47:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E6142C433C8;
 Sat, 16 Sep 2023 15:47:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1694879263;
 bh=9yoeSuSu4c9avKuB9jsu8jsIQJYt6cBB3MWv0m0Z7y0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Qe8Sc6HLO2iQZ9PjqYe1yCCRQ1tpnCuR3MCfNQEU9aSMLnwJM9Hhl0/bONQXIPfd5
 WmLJsJ/tiCNRjsOKIFJrc2i9jLeX7G5SS1WMXuDoyRed0jMGkLFprFwDmwk4uSNBo5
 z6ceK18Ahw1+EMw+kgrsL+y+BNFk92hEn94HOTDhhQuHSpCT7W4z6fjg14rH6BVQ86
 yY2MiMDmDCOpc183NEO2j4DrbMiLlKzbh1njf4KTt+Ghvfo1kClALhuvrvFFubX7Gy
 8BQRvSt3QIWMEg4BoyZh+DRbmRrMUX95NQa6vByR7Blu7bKb6cIEV6V/g44xjWsCfk
 WKOnp3JIalObg==
Date: Sat, 16 Sep 2023 17:47:37 +0200
From: Simon Horman <horms@kernel.org>
To: Jisheng Zhang <jszhang@kernel.org>
Message-ID: <20230916154737.GG1125562@kernel.org>
References: <20230915005316.592-1-jszhang@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230915005316.592-1-jszhang@kernel.org>
Cc: linux-kernel@vger.kernel.org, Samuel Holland <samuel@sholland.org>,
 netdev@vger.kernel.org,
 Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 linux-stm32@st-md-mailman.stormreply.com,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Chen-Yu Tsai <wens@csie.org>,
 Eric Dumazet <edumazet@google.com>, Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, johannes@sipsolutions.net,
 Paolo Abeni <pabeni@redhat.com>, linux-sunxi@lists.linux.dev,
 "David S . Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] net: stmmac: fix incorrect rxq|txq_stats
	reference
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

T24gRnJpLCBTZXAgMTUsIDIwMjMgYXQgMDg6NTM6MTZBTSArMDgwMCwgSmlzaGVuZyBaaGFuZyB3
cm90ZToKPiBjb21taXQgMTMzNDY2YzNiYmUxICgibmV0OiBzdG1tYWM6IHVzZSBwZXItcXVldWUg
NjQgYml0IHN0YXRpc3RpY3MKPiB3aGVyZSBuZWNlc3NhcnkiKSBjYXVzZWQgb25lIHJlZ3Jlc3Np
b24gYXMgZm91bmQgYnkgVXdlLCB0aGUgYmFja3RyYWNlCj4gbG9va3MgbGlrZToKPiAKPiBJTkZP
OiB0cnlpbmcgdG8gcmVnaXN0ZXIgbm9uLXN0YXRpYyBrZXkuCj4gVGhlIGNvZGUgaXMgZmluZSBi
dXQgbmVlZHMgbG9ja2RlcCBhbm5vdGF0aW9uLCBvciBtYXliZQo+IHlvdSBkaWRuJ3QgaW5pdGlh
bGl6ZSB0aGlzIG9iamVjdCBiZWZvcmUgdXNlPwo+IHR1cm5pbmcgb2ZmIHRoZSBsb2NraW5nIGNv
cnJlY3RuZXNzIHZhbGlkYXRvci4KPiBDUFU6IDAgUElEOiAxIENvbW06IHN3YXBwZXIvMCBOb3Qg
dGFpbnRlZCA2LjUuMC1yYzEtMDA0NDktZzEzMzQ2NmMzYmJlMS1kaXJ0eSAjMjEKPiBIYXJkd2Fy
ZSBuYW1lOiBTVE0zMiAoRGV2aWNlIFRyZWUgU3VwcG9ydCkKPiAgdW53aW5kX2JhY2t0cmFjZSBm
cm9tIHNob3dfc3RhY2srMHgxOC8weDFjCj4gIHNob3dfc3RhY2sgZnJvbSBkdW1wX3N0YWNrX2x2
bCsweDYwLzB4OTAKPiAgZHVtcF9zdGFja19sdmwgZnJvbSByZWdpc3Rlcl9sb2NrX2NsYXNzKzB4
OThjLzB4OTljCj4gIHJlZ2lzdGVyX2xvY2tfY2xhc3MgZnJvbSBfX2xvY2tfYWNxdWlyZSsweDc0
LzB4MjkzYwo+ICBfX2xvY2tfYWNxdWlyZSBmcm9tIGxvY2tfYWNxdWlyZSsweDEzNC8weDM5OAo+
ICBsb2NrX2FjcXVpcmUgZnJvbSBzdG1tYWNfZ2V0X3N0YXRzNjQrMHgyYWMvMHgyZmMKPiAgc3Rt
bWFjX2dldF9zdGF0czY0IGZyb20gZGV2X2dldF9zdGF0cysweDQ0LzB4MTMwCj4gIGRldl9nZXRf
c3RhdHMgZnJvbSBydG5sX2ZpbGxfc3RhdHMrMHgzOC8weDEyMAo+ICBydG5sX2ZpbGxfc3RhdHMg
ZnJvbSBydG5sX2ZpbGxfaWZpbmZvKzB4ODM0LzB4MTdmNAo+ICBydG5sX2ZpbGxfaWZpbmZvIGZy
b20gcnRtc2dfaWZpbmZvX2J1aWxkX3NrYisweGMwLzB4MTQ0Cj4gIHJ0bXNnX2lmaW5mb19idWls
ZF9za2IgZnJvbSBydG1zZ19pZmluZm8rMHg1MC8weDg4Cj4gIHJ0bXNnX2lmaW5mbyBmcm9tIF9f
ZGV2X25vdGlmeV9mbGFncysweGMwLzB4ZWMKPiAgX19kZXZfbm90aWZ5X2ZsYWdzIGZyb20gZGV2
X2NoYW5nZV9mbGFncysweDUwLzB4NWMKPiAgZGV2X2NoYW5nZV9mbGFncyBmcm9tIGlwX2F1dG9f
Y29uZmlnKzB4MmY0LzB4MTI2MAo+ICBpcF9hdXRvX2NvbmZpZyBmcm9tIGRvX29uZV9pbml0Y2Fs
bCsweDcwLzB4MzVjCj4gIGRvX29uZV9pbml0Y2FsbCBmcm9tIGtlcm5lbF9pbml0X2ZyZWVhYmxl
KzB4MmFjLzB4MzA4Cj4gIGtlcm5lbF9pbml0X2ZyZWVhYmxlIGZyb20ga2VybmVsX2luaXQrMHgx
Yy8weDEzOAo+ICBrZXJuZWxfaW5pdCBmcm9tIHJldF9mcm9tX2ZvcmsrMHgxNC8weDJjCj4gCj4g
VGhlIHJlYXNvbiBpcyB0aGUgcnhxfHR4cV9zdGF0cyBzdHJ1Y3R1cmVzIGFyZSBub3Qgd2hhdCBl
eHBlY3RlZAo+IGJlY2F1c2Ugc3RtbWFjX29wZW4oKSAtPiBfX3N0bW1hY19vcGVuKCkgdGhlIHN0
cnVjdHVyZSBpcyBvdmVyd3JpdHRlbgo+IGJ5ICJtZW1jcHkoJnByaXYtPmRtYV9jb25mLCBkbWFf
Y29uZiwgc2l6ZW9mKCpkbWFfY29uZikpOyIKPiBUaGlzIGNhdXNlcyB0aGUgd2VsbCBpbml0aWFs
aXplZCBzeW5jcCBtZW1iZXIgb2YgcnhxfHR4cV9zdGF0cyBpcwo+IG92ZXJ3cml0dGVuIHVuZXhw
ZWN0ZWRseSBhcyBwb2ludGVkIG91dCBieSBKb2hhbm5lcyBhbmQgVXdlLgo+IAo+IEZpeCB0aGlz
IGlzc3VlIGJ5IG1vdmluZyByeHF8dHhxX3N0YXRzIGJhY2sgdG8gc3RtbWFjX2V4dHJhX3N0YXRz
LiBGb3IKPiBTTVAgY2FjaGUgZnJpZW5kbHksIHdlIGFsc28gbWFyayBzdG1tYWNfdHhxX3N0YXRz
IGFuZCBzdG1tYWNfcnhxX3N0YXRzCj4gYXMgX19fX2NhY2hlbGluZV9hbGlnbmVkX2luX3NtcC4K
PiAKPiBGaXhlczogMTMzNDY2YzNiYmUxICgibmV0OiBzdG1tYWM6IHVzZSBwZXItcXVldWUgNjQg
Yml0IHN0YXRpc3RpY3Mgd2hlcmUgbmVjZXNzYXJ5IikKPiBTaWduZWQtb2ZmLWJ5OiBKaXNoZW5n
IFpoYW5nIDxqc3poYW5nQGtlcm5lbC5vcmc+Cj4gUmVwb3J0ZWQtYnk6IFV3ZSBLbGVpbmUtS8O2
bmlnIDx1LmtsZWluZS1rb2VuaWdAcGVuZ3V0cm9uaXguZGU+CgpIaSBKaXNoZW5nIFpoYW5nLAoK
YXMgYSBmaXggZm9yIE5ldHdvcmtpbmcgY29kZSB0aGlzIHNob3VsZCBiZSBiYXNlZCB0YXJnZXRl
ZCBhdCB0aGUgbmV0IHRyZWUuCgogIFN1YmplY3Q6IFtQQVRDSCBuZXRdIC4uLgoKVW5mb3J0dW5h
dGVseSBpdCBkb2Vzbid0IGFwcGx5IGNsZWFubHkgYWdhaW5zdCBuZXQuClBsZWFzZSBjb25zaWRl
ciByZWJhc2luZyBhbmQgcmVwb3N0aW5nLgoKLS0gCnB3LWJvdDogY2hhbmdlcy1yZXF1ZXN0ZWQK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3Rt
MzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20K
aHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtc3RtMzIK
