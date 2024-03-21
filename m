Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D9DDC885600
	for <lists+linux-stm32@lfdr.de>; Thu, 21 Mar 2024 09:47:32 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 91432C6DD68;
	Thu, 21 Mar 2024 08:47:32 +0000 (UTC)
Received: from www530.your-server.de (www530.your-server.de [188.40.30.78])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id F2AFCC6C85A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 21 Mar 2024 08:47:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=geanix.com; 
 s=default2211;
 h=To:References:Message-Id:Content-Transfer-Encoding:Cc:Date:
 In-Reply-To:From:Subject:Mime-Version:Content-Type:Sender:Reply-To:Content-ID
 :Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:
 Resent-Cc:Resent-Message-ID; bh=k47p/mv2Nny8rLL23fZP28IM8cxC8c/zBHnuYWhK1GA=; 
 b=GUm0AwRvGY1vai6wrCmLN6xb21Mt6ldroFnKHgJ2ZLnCwE+Uaf6iGJV+5diTA9aYnckNcQ8nuFg
 euZXCQXxuBPnblBh6l8yqhY10tebrIGavsmoLH6dCvfUXDgT4CfbNNXi1X+r7wxjV29n5QLYtv2r+
 Ug7uEjrXcNTn6DV4oY6rUJD534vNoMmJYz7EIe47lVO+K+NLG8ZCr1y8Vdn3AINKm95lQ/H6qZknK
 SoxP2wTIpY76MWG/zBlbtrO1HwCgRPcPj/w6RFoGNrfPVLbEYj0ThODkc2n1abXOWUK9q6QMjTI81
 g3XmWn5JecCUwUEtmJ1L9Xv5S43aMFaW1X6Q==;
Received: from sslproxy03.your-server.de ([88.198.220.132])
 by www530.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
 (Exim 4.94.2) (envelope-from <sean@geanix.com>)
 id 1rnE5C-000NxO-At; Thu, 21 Mar 2024 09:47:30 +0100
Received: from [185.17.218.86] (helo=smtpclient.apple)
 by sslproxy03.your-server.de with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <sean@geanix.com>) id 1rnE5B-000GHH-1c;
 Thu, 21 Mar 2024 09:47:29 +0100
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3774.400.31\))
From: Sean Nyekjaer <sean@geanix.com>
In-Reply-To: <20240320-berserk-soft-crab-70d22c@houat>
Date: Thu, 21 Mar 2024 09:47:18 +0100
Message-Id: <2A220F57-5DD2-4F28-9328-547A04185D3F@geanix.com>
References: <4A53A669-C3AF-4D29-B5A5-0F7FEBA79045@geanix.com>
 <20240320-berserk-soft-crab-70d22c@houat>
To: Maxime Ripard <mripard@redhat.com>
X-Mailer: Apple Mail (2.3774.400.31)
X-Authenticated-Sender: sean@geanix.com
X-Virus-Scanned: Clear (ClamAV 0.103.10/27220/Wed Mar 20 09:25:13 2024)
Cc: =?utf-8?Q?Martin_Hundeb=C3=B8ll?= <martin@geanix.com>,
 yannick.fertre@foss.st.com, dri-devel@lists.freedesktop.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] STM32 DSI controller driver: mode_valid clock
	tolerance
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

SGkgTWF4aW1lLAoKPiBPbiAyMCBNYXIgMjAyNCwgYXQgMTQuMjMsIE1heGltZSBSaXBhcmQgPG1y
aXBhcmRAcmVkaGF0LmNvbT4gd3JvdGU6Cj4gCj4gSGkgU2VhbiwKPiAKPiBPbiBGcmksIE1hciAw
OCwgMjAyNCBhdCAwOTozNToyN0FNICswMTAwLCBTZWFuIE55ZWtqYWVyIHdyb3RlOgo+PiBJ4oCZ
bSB1c2luZyBhIHN0bTMybXAxNTcgd2l0aCBhIHNuNjVkc2k4MyBEU0kyTFZEUyBicmlkZ2UuIFRo
ZSBMVkRTCj4+IGRpc3BsYXkgaXMgaGF2aW5nIGEgbWluaW11bSBjbG9jayBvZiAyNS4yIE1Ieiwg
dHlwaWNhbCBvZiAyNywyIE1IeiBhbmQKPj4gYSBtYXggb2YgMzAsNSBNSHouCj4+IAo+PiBJIHdp
bGwgZmFpbCB0aGUgbW9kZV92YWxpZCBjaGVjayB3aXRoIE1PREVfQ0xPQ0tfUkFOR0UuIEl0IHdp
bGwKPj4gcmVxdWVzdCAyNzIwMDAwMCBIeiwgYnV0IGlzIGdldHRpbmcgMjcyNTAwMDAuIEd1ZXNz
IHRoZSBkaXNwbGF5IGlzCj4+IGZpbmUgd2l0aCB0aGlzIDopCj4+IAo+PiBJbiB0aGlzIGNhc2Ug
aXQgc2VlbXMgYSBiaXQgaGFyc2ggdG8gZmFpbCBpZiB0aGUgb3V0cHV0IGNsb2NrIGlzbuKAmXQK
Pj4gd2l0aGluIDUwIEh6IG9mIHRoZSByZXF1ZXN0ZWQgY2xvY2suCj4gCj4gRXZlbiBmb3IgSERN
SSwgdGhlIHRvbGVyYW5jZSBpcyB1c3VhbGx5IC41JSBvZiB0aGUgcGl4ZWwgY2xvY2suIDUwSHoK
PiBzZWVtcyBvdmVybHkgcmVzdHJpY3RpdmUuCgpPawoKPiAKPj4gSWYgSERNSSBpcyByZXF1aXJp
bmcgYSB0b2xlcmFuY2Ugb2YgNTAgSHosIHdvdWxkIGl0IGJlIGJldHRlciB0byBkbwo+PiB0aGUg
Y2hlY2sgaW4gdGhlIEhETUkgYnJpZGdlIGRyaXZlcj8KPiAKPiBKdWRnaW5nIGZyb20gdGhlIGNv
ZGUsIGl0IHdvdWxkIGJlIGhhcmQgdG8gZG8gYmVjYXVzZSB0aGUgY2xvY2sgdGhhdAo+IGdlbmVy
YXRlcyB0aGUgcGl4ZWwgY2xvY2sgaXNuJ3QgZXhwb3NlZCB0byB0aGUgSERNSSBicmlkZ2UuCgpX
aGF0IGRvIHlvdSB0aGluayBhYm91dCBSYXBoYWVs4oCZcyBwcm9wb3NhbCB0byBhZGQgdGhlIHRv
bGVyYW5jZSBhcyBhIGRldmljZSB0cmVlIG9wdGlvbj8KCj4gCj4gTWF4aW1lCgovU2VhbgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBt
YWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRw
czovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1z
dG0zMgo=
