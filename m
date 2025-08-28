Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EF569B3AAC2
	for <lists+linux-stm32@lfdr.de>; Thu, 28 Aug 2025 21:20:58 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6470CC3F95F;
	Thu, 28 Aug 2025 19:20:58 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E05AAC3F95E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 28 Aug 2025 19:20:57 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 8D7DD408D6;
 Thu, 28 Aug 2025 19:20:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 39148C4CEEB;
 Thu, 28 Aug 2025 19:20:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1756408856;
 bh=xgoO4M24DDsETImgJteajsEhHPcXATQbldGDe37SjjU=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=HyvCtjepwxlQbLPWbRwQxWRSnxUoo3KIxjt0L7MzUTd1nz/g3xGlxKDaQZDRrCRVp
 Je656D48eJo7JycZf5LXz5JFHotSFgwUbjuWJVl4egWp/77DFSfpoo6y52p+fpxsjJ
 nuQINnQtKhLOu6FW2Szrrd06eA+l/Kw/QojwNhzyiHPPXl0A+ee97N4oSSXItZFnOA
 NmiWpaHWxCv9ON02pbwnXXazsuEtCi0cPDMlqt5PGMy6AlF1x99nu73KtzsPByG0+4
 MeQStzP2fN6VGd/giQIpXjZcv+hYaiat58ztolRCJHSQAOUSsNIZZXAMmZCWPk/Y7Z
 3wZFycMpNCiXg==
Date: Thu, 28 Aug 2025 14:20:54 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Christian Bruel <christian.bruel@foss.st.com>
Message-ID: <20250828192054.GA957771@bhelgaas>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <0fbf4be0-af6e-4119-a838-e3fc9ab1fc9d@foss.st.com>
Cc: linux-doc@vger.kernel.org, linux-pci@vger.kernel.org, lpieralisi@kernel.org,
 quic_schintav@quicinc.com, linux-stm32@st-md-mailman.stormreply.com,
 kwilczynski@kernel.org, namcao@linutronix.de, robh@kernel.org, corbet@lwn.net,
 linux-arm-kernel@lists.infradead.org, linus.walleij@linaro.org,
 mayank.rana@oss.qualcomm.com, devicetree@vger.kernel.org, conor+dt@kernel.org,
 mcoquelin.stm32@gmail.com, mani@kernel.org, qiang.yu@oss.qualcomm.com,
 linux-gpio@vger.kernel.org, bhelgaas@google.com, johan+linaro@kernel.org,
 shradha.t@samsung.com, thippeswamy.havalige@amd.com, inochiama@gmail.com,
 linux-kernel@vger.kernel.org, p.zabel@pengutronix.de, krzk+dt@kernel.org
Subject: Re: [Linux-stm32] [PATCH v13 06/11] PCI: stm32: Add PCIe Endpoint
 support for STM32MP25
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

T24gVGh1LCBBdWcgMjgsIDIwMjUgYXQgMDk6MDY6MzNQTSArMDIwMCwgQ2hyaXN0aWFuIEJydWVs
IHdyb3RlOgo+IE9uIDgvMjgvMjUgMTk6MjIsIEJqb3JuIEhlbGdhYXMgd3JvdGU6Cj4gPiBPbiBX
ZWQsIEF1ZyAyMCwgMjAyNSBhdCAwOTo1NDowNkFNICswMjAwLCBDaHJpc3RpYW4gQnJ1ZWwgd3Jv
dGU6Cj4gPiA+IEFkZCBkcml2ZXIgdG8gY29uZmlndXJlIHRoZSBTVE0zMk1QMjUgU29DIFBDSWUg
R2VuMSAyLjVHVC9zIG9yIEdlbjIgNUdUL3MKPiA+ID4gY29udHJvbGxlciBiYXNlZCBvbiB0aGUg
RGVzaWduV2FyZSBQQ0llIGNvcmUgaW4gZW5kcG9pbnQgbW9kZS4KPiA+ID4gLi4uCj4gPiAKPiA+
ID4gK3N0YXRpYyBpbnQgc3RtMzJfcGNpZV9zdGFydF9saW5rKHN0cnVjdCBkd19wY2llICpwY2kp
Cj4gPiA+ICt7Cj4gPiA+ICsJc3RydWN0IHN0bTMyX3BjaWUgKnN0bTMyX3BjaWUgPSB0b19zdG0z
Ml9wY2llKHBjaSk7Cj4gPiA+ICsJaW50IHJldDsKPiA+ID4gKwo+ID4gPiArCWlmIChzdG0zMl9w
Y2llLT5saW5rX3N0YXR1cyA9PSBTVE0zMl9QQ0lFX0VQX0xJTktfRU5BQkxFRCkgewo+ID4gPiAr
CQlkZXZfZGJnKHBjaS0+ZGV2LCAiTGluayBpcyBhbHJlYWR5IGVuYWJsZWRcbiIpOwo+ID4gPiAr
CQlyZXR1cm4gMDsKPiA+ID4gKwl9Cj4gPiAKPiA+IFdoaWxlIGxvb2tpbmcgYXQgdGhlICJpbmNv
cnJlY3RseSByZXNldCIgY29tbWVudCwgSSBub3RpY2VkCj4gPiBzdG0zMl9wY2llLT5saW5rX3N0
YXR1cyBhbmQgd29uZGVyZWQgd2h5IGl0IGV4aXN0cy4gIEl0IGxvb2tzIGxpa2UKPiA+IGl0J3Mg
b25seSB1c2VkIGluIHN0bTMyX3BjaWVfc3RhcnRfbGluaygpIGFuZCBzdG0zMl9wY2llX3N0b3Bf
bGluaygpLAo+ID4gYW5kIEkgZG9uJ3Qgc2VlIHNpbWlsYXIgdHJhY2tpbmcgaW4gb3RoZXIgZHJp
dmVycy4KPiA+IAo+ID4gSXQgZmVlbHMgYSBsaXR0bGUgcmFjeSBiZWNhdXNlIHRoZSBsaW5rIG1p
Z2h0IGdvIGRvd24gZm9yIHJlYXNvbnMKPiA+IG90aGVyIHRoYW4gY2FsbGluZyBzdG0zMl9wY2ll
X3N0b3BfbGluaygpLgo+IAo+IEkgdGhpbmsgdGhhdCBhcyBhbiBleGNlc3Mgb2YgcGFyYW5vaWQg
dGhhdCB3YXMgbWVhbnQgdG8gcHJvdGVjdCBhZ2FpbnN0IGEKPiBkcml2ZXIgdW5iaW5kIHdoZW4g
dGhlIGxpbmsgaGFzbuKAmXQgc3RhcnRlZCB5ZXQuIEluIHRoYXQgY2FzZSwKPiBzdG0zMl9wY2ll
X3JlbW92ZSgpIHdvdWxkIGRpc2FibGUgYSBsaW5rIHRoYXTigJlzIGFscmVhZHkgZGlzYWJsZWQu
Cj4gCj4gQnV0IHRoYXQgc2hvdWxkbuKAmXQgYmUgYSBwcm9ibGVtIHRvIGRpc2FibGUgdHdpY2Ug
dGhlIGx0c3NtIGVuYWJsZSBiaXQsIGFzCj4gd2VsbCBhcyB0aGUgcGVyc3QgaXJxLiBJ4oCZbGwg
bG9vayBpbnRvIHJlbW92aW5nIGl0LiBJcyBpdCBva2F5IGlmIEkgZG8gdGhpcwo+IHdpdGggYSBm
aXh1cCBwYXRjaD8KClN1cmUuICBXZSdsbCBwdXQgaXQgaW4gcGNpL25leHQgYXMtaXMsIGFuZCBp
Zi93aGVuIHlvdSBwb3N0IGEgcGF0Y2ggdG8KcmVtb3ZlIGxpbmtfc3RhdHVzLCB3ZSdsbCBzcXVh
c2ggaXQgaW4uCgpCam9ybgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1h
bi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFp
bG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
