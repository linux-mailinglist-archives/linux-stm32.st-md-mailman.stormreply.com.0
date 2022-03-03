Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 09BCB4CB711
	for <lists+linux-stm32@lfdr.de>; Thu,  3 Mar 2022 07:32:54 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B1EF5C5F1EE;
	Thu,  3 Mar 2022 06:32:53 +0000 (UTC)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E6800C57B6F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  3 Mar 2022 06:32:51 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 56FD7B823EC;
 Thu,  3 Mar 2022 06:32:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D724C004E1;
 Thu,  3 Mar 2022 06:32:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1646289169;
 bh=1hdFwEApQ9grBt9oUPeinkV2LDuNqdSmho2UK/4xVWg=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=oE0YAJ2Oene2ROCb5HFP22eUFe02tXZLVohtit2VWvw+lApDzStQqPLHyFEPnIN99
 FLuNtuMOyuwJ8gPHNd4Cp6ctLXVn+fFhwcA3xeoMeu2W1TjE8FSDz2L+ktvc1coXV7
 maDaR4oLMlsRP+00H0E+qqcVasN8oOT3ER8TSPZ9ljU9rOuL6B42cfOgkVXeDRDcwI
 rfVko6YmOK+YL1WCixLdp1Ddmlk2QLpwhe7zHnf5m8ILqfxum4GquS/SkBb7h+DMMy
 uzcX4C+Hj3Vbj9ZgZJ+Ozm7pvCb92l0NpFC3NK+dNRKW9sq8IwF2HNyOgAU973pdgP
 4G1/QbTXplyhQ==
Date: Wed, 2 Mar 2022 22:32:48 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Wong Vee Khee <vee.khee.wong@linux.intel.com>
Message-ID: <20220302223248.2492658e@kicinski-fedora-PC1C0HJN.hsd1.ca.comcast.net>
In-Reply-To: <20220228111558.3825974-1-vee.khee.wong@linux.intel.com>
References: <20220228111558.3825974-1-vee.khee.wong@linux.intel.com>
MIME-Version: 1.0
Cc: linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 pei.lee.ling@intel.com, Alexandre Torgue <alexandre.torgue@foss.st.com>,
 linux-stm32@st-md-mailman.stormreply.com, Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 "David S . Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net 1/1] net: stmmac: Resolve poor line
 rate after switching from TSO off to TSO on
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

T24gTW9uLCAyOCBGZWIgMjAyMiAxOToxNTo1OCArMDgwMCBXb25nIFZlZSBLaGVlIHdyb3RlOgo+
IEZyb206IExpbmcgUGVpIExlZSA8cGVpLmxlZS5saW5nQGludGVsLmNvbT4KPiAKPiBTZXF1ZW50
aWFsIGV4ZWN1dGlvbiBvZiB0aGVzZSBzdGVwczoKPiBpKSBUU08gT04g4oCTIGlwZXJmMyBleGVj
dXRpb24sCj4gaWkpIFRTTyBPRkYg4oCTIGlwZXJmMyBleGVjdXRpb24sCj4gaWlpKSBUU08gT04g
4oCTIGlwZXJmMyBleGVjdXRpb24sIGl0IGxlYWRzIHRvIGlwZXJmMyAwIGJ5dGVzIHRyYW5zZmVy
LgoKSU1ITyB0aGUgaXBlcmYgb3V0cHV0IGNhbiBiZSBkcm9wcGVkIGZyb20gdGhlIGNvbW1pdCBt
ZXNzYWdlLCAKaXQgZG9lc24ndCBhZGQgbXVjaCBiZXlvbmQgdGhpcyBkZXNjcmlwdGlvbi4KCj4g
Q2xlYXIgbXNzIGluIFRERVMgYW5kIGNhbGwgc3RtbWFjX2VuYWJsZV90c28oKSB0byBpbmRpY2F0
ZQo+IGEgbmV3IFRTTyB0cmFuc21pc3Npb24gd2hlbiBpdCBpcyBlbmFibGVkIGZyb20gVFNPIG9m
ZiB1c2luZwo+IGV0aHRvb2wgY29tbWFuZAoKSG93IGRvZXMgdGhlIFRTTyBnZXQgZGlzYWJsZWQg
SSBkb24ndCBzZWUgYW55IC4uLmVuYWJsZV90c28oLCAwLCApCmNhbGxzIGluIHRoZSBkcml2ZXI/
IEFuZCB3aHkgY2FsbCBlbmFibGUgaW4gZml4X2ZlYXR1cmVzIHJhdGhlciAKdGhhbiBzZXRfZmVh
dHVyZXM/Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxp
bnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVw
bHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LXN0bTMyCg==
