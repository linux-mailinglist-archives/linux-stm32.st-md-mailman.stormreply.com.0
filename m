Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1699A30253A
	for <lists+linux-stm32@lfdr.de>; Mon, 25 Jan 2021 14:02:41 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CD1CEC5663B;
	Mon, 25 Jan 2021 13:02:40 +0000 (UTC)
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.9])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2D517C36B37
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 25 Jan 2021 13:02:38 +0000 (UTC)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
 by mail-out.m-online.net (Postfix) with ESMTP id 4DPVQQ1QTKz1qw9N;
 Mon, 25 Jan 2021 14:02:38 +0100 (CET)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
 by mail.m-online.net (Postfix) with ESMTP id 4DPVQP6bksz1s8Tc;
 Mon, 25 Jan 2021 14:02:37 +0100 (CET)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
 port 10024)
 with ESMTP id n_pn9R991jV9; Mon, 25 Jan 2021 14:02:36 +0100 (CET)
X-Auth-Info: p6QN/QHmR8x/ANED8+CFP8bMcqEuKzu9KqqOS2C8IVI=
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.mnet-online.de (Postfix) with ESMTPSA;
 Mon, 25 Jan 2021 14:02:36 +0100 (CET)
To: Yann GAUTIER <yann.gautier@foss.st.com>,
 linux-arm-kernel@lists.infradead.org,
 Linus Walleij <linus.walleij@linaro.org>, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Liviu Dudau <liviu.dudau@arm.com>, Sudeep Holla <sudeep.holla@arm.com>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
References: <20210124170337.32917-1-marex@denx.de>
 <eb8c62eb-87c1-0011-49ae-260239daf79e@foss.st.com>
From: Marek Vasut <marex@denx.de>
Message-ID: <f8515297-7884-4e4b-eca1-24b25e66e8b9@denx.de>
Date: Mon, 25 Jan 2021 14:02:35 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <eb8c62eb-87c1-0011-49ae-260239daf79e@foss.st.com>
Content-Language: en-US
Cc: devicetree@vger.kernel.org, Ulf Hansson <ulf.hansson@linaro.org>,
 Alexandre Torgue <alexandre.torgue@st.com>,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH V2] ARM: dts: stm32: Rename mmc controller
 nodes to mmc@
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

T24gMS8yNS8yMSAxOjU4IFBNLCBZYW5uIEdBVVRJRVIgd3JvdGU6Cj4gT24gMS8yNC8yMSA2OjAz
IFBNLCBNYXJlayBWYXN1dCB3cm90ZToKPj4gUGVyIG1tYy1jb250cm9sbGVyLnlhbWwsIHRoZSBu
b2RlIHBhdHRlcm4gaXMiXm1tYyhALiopPyQiwqAgLAo+PiBzbyBhZGp1c3QgdGhlIG5vZGUuCgpb
Li4uXQoKSGksCgo+IEhpIE1hcmVrLAo+IAo+IEFja2VkLWJ5OiBZYW5uIEdhdXRpZXIgPHlhbm4u
Z2F1dGllckBmb3NzLnN0LmNvbT4KPiAKPiAKPiBEbyB5b3Uga25vdyBpZiBzaW1pbGFyIHBhdGNo
ZXMgYXJlIHBsYW5uZWQgZm9yIG90aGVyIHBsYXRmb3JtIHVzaW5nIHRoaXMgCj4gSVAgKFF1YWxj
b20sIFNULUVyaWNzc29uLCBBcm0gdmV4cHJlc3MuLi4pPwo+IEkgZm91bmQgaXNzdWVzIHdpdGgg
dGhlbSB3aGVuIHJ1bm5pbmcgdGhpcyBjb21tYW5kOgo+IG1ha2UgLWsgZHRic19jaGVjayAKPiBE
VF9TQ0hFTUFfRklMRVM9RG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL21tYy9hcm0s
cGwxOHgueWFtbAo+IAo+IE1heWJlIExpbnVzIGFscmVhZHkgc2VudCB0aGUgaW5mbz8KPiBBZGRp
bmcgdGhvc2Ugb3RoZXIgcGxhdGZvcm1zIG1haW50YWluZXJzLgoKTWF5YmUganVzdCBmaXggdGhl
bSBhbmQgc2VuZCBwYXRjaCwgc2luY2UgeW91J3JlIGF0IGl0IGFscmVhZHkgPwpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5n
IGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0
LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
