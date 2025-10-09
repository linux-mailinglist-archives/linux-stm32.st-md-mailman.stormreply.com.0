Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BEF0BC9E80
	for <lists+linux-stm32@lfdr.de>; Thu, 09 Oct 2025 18:01:15 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5A96EC555B7;
	Thu,  9 Oct 2025 16:01:15 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 92A9CC555B1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  9 Oct 2025 16:01:13 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 5D19943B23;
 Thu,  9 Oct 2025 16:01:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 40515C4CEF8;
 Thu,  9 Oct 2025 16:01:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1760025672;
 bh=vgTvzbuaErSOmNKUcF02F+y/az0JKy9Pe3Vija2d2N0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=HAEDLbebriCaMUmhik/TelHHejTzGDAdNwpxRtx381NgCRGipNVvleEJ35JopDfuf
 xoaC6zb5nAPIXZhtjt7B+c4uaNSA5Jdr0444k50prVyr0twZk3FfDzUxTm0umnS/G7
 KgXuvLQDWuwkJplyS001x18Fy4zodscy6cUDeYDSh01IsKdNiJTj+fQhPT3QV5LXG7
 cIjLPmYBQ+sv8jFF8Q+NaNdUBcmEIu8gVjuUnIf/Tg7OOJzMa6vF3esDiIbWSphK32
 y1+WIu7abDxQQV/EJMZ3y4SGNbYcgcwcHx5bP/ToHQ9UGCAnKoCofgAIFHaaUWa7lg
 DskP3l//WnKkQ==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Date: Thu,  9 Oct 2025 11:56:12 -0400
Message-ID: <20251009155752.773732-106-sashal@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251009155752.773732-1-sashal@kernel.org>
References: <20251009155752.773732-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.17.1
Cc: Sasha Levin <sashal@kernel.org>,
 Alexander Stein <alexander.stein@ew.tq-group.com>, Lee Jones <lee@kernel.org>,
 mcoquelin.stm32@gmail.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH AUTOSEL 6.17-5.4] mfd: stmpe-i2c: Add missing
	MODULE_LICENSE
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

RnJvbTogQWxleGFuZGVyIFN0ZWluIDxhbGV4YW5kZXIuc3RlaW5AZXcudHEtZ3JvdXAuY29tPgoK
WyBVcHN0cmVhbSBjb21taXQgMDBlYTU0ZjA1OGNkNGNiMDgyMzAyZmU1OThjZmUxNDhlMGFhZGY5
NCBdCgpUaGlzIGRyaXZlciBpcyBsaWNlbnNlZCBHUEwtMi4wLW9ubHksIHNvIGFkZCB0aGUgY29y
cmVzcG9uZGluZyBtb2R1bGUgZmxhZy4KClNpZ25lZC1vZmYtYnk6IEFsZXhhbmRlciBTdGVpbiA8
YWxleGFuZGVyLnN0ZWluQGV3LnRxLWdyb3VwLmNvbT4KTGluazogaHR0cHM6Ly9sb3JlLmtlcm5l
bC5vcmcvci8yMDI1MDcyNTA3MTE1My4zMzg5MTItMy1hbGV4YW5kZXIuc3RlaW5AZXcudHEtZ3Jv
dXAuY29tClNpZ25lZC1vZmYtYnk6IExlZSBKb25lcyA8bGVlQGtlcm5lbC5vcmc+ClNpZ25lZC1v
ZmYtYnk6IFNhc2hhIExldmluIDxzYXNoYWxAa2VybmVsLm9yZz4KLS0tCgpMTE0gR2VuZXJhdGVk
IGV4cGxhbmF0aW9ucywgbWF5IGJlIGNvbXBsZXRlbHkgYm9ndXM6CgpZRVMKCioqV2hhdCBDaGFu
Z2VkKioKLSBBZGRzIG1pc3NpbmcgbW9kdWxlIGxpY2Vuc2UgZGVjbGFyYXRpb246IGBNT0RVTEVf
TElDRU5TRSgiR1BMIik7YCBpbgogIGRyaXZlcnMvbWZkL3N0bXBlLWkyYy5jOjEyOS4KCioqV2h5
IEl0IE1hdHRlcnMqKgotIFdpdGhvdXQgYSBgTU9EVUxFX0xJQ0VOU0VgLCBtb2R1bGVzIGFyZSB0
cmVhdGVkIGFzIG5vbuKAkUdQTCBjb21wYXRpYmxlLAogIHdoaWNoIHRhaW50cyB0aGUga2VybmVs
IGFuZCBibG9ja3MgYWNjZXNzIHRvIEdQTOKAkW9ubHkgZXhwb3J0czoKICAtIExpY2Vuc2UgY29t
cGF0aWJpbGl0eSBjaGVjazogaW5jbHVkZS9saW51eC9saWNlbnNlLmg6NSB0cmVhdHMKICAgIGAi
R1BMImAgYXMgR1BM4oCRY29tcGF0aWJsZS4KICAtIFRhaW50IG9uIHVua25vd24vbm9u4oCRR1BM
IGxpY2Vuc2VzOiBrZXJuZWwvbW9kdWxlL21haW4uYzoxNzQyCiAgICB0cmlnZ2VycyBgVEFJTlRf
UFJPUFJJRVRBUllfTU9EVUxFYCB3aGVuIGxpY2Vuc2UgaXNu4oCZdAogICAgR1BM4oCRY29tcGF0
aWJsZS4KLSBUaGUgZHJpdmVyIGNhcnJpZXMgdGhlIFNQRFggaGVhZGVyIGBHUEwtMi4wLW9ubHlg
LCBzbyB0aGUgbW9kdWxlIGZsYWcKICBhbGlnbnMgbWV0YWRhdGEgd2l0aCB0aGUgYWN0dWFsIGxp
Y2Vuc2UuCi0gQXZvaWRzIHVzZXLigJF2aXNpYmxlIG51aXNhbmNlOiBkbWVzZyB3YXJuaW5nIGFu
ZCBrZXJuZWwgdGFpbnQgb24gbG9hZAogIGZvciB0aGlzIG1vZHVsZSB3aGVuIGJ1aWx0IGFzIGEg
bW9kdWxlLgoKKipTY29wZSBhbmQgUmlzayoqCi0gT25lLWxpbmUgbWV0YWRhdGEtb25seSBjaGFu
Z2UgaW4gYSBzaW5nbGUgZmlsZTsgbm8gZnVuY3Rpb25hbCBvcgogIGFyY2hpdGVjdHVyYWwgY2hh
bmdlcy4KLSBWZXJ5IGxvdyByZWdyZXNzaW9uIHJpc2s7IGRvZXMgbm90IG1vZGlmeSBwcm9iZS9y
ZW1vdmUgcGF0aHMgb3IgZGF0YQogIGZsb3dzLgoKKipDb250ZXh0IGFuZCBIaXN0b3J5KioKLSBU
aGUgZHJpdmVyIGlzIG1vZHVsYXItY2FwYWJsZTogYGNvbmZpZyBTVE1QRV9JMkNgIGlzIGB0cmlz
dGF0ZWAKICAoZHJpdmVycy9tZmQvS2NvbmZpZzoxNjAwKSwgc28gYSBtb2R1bGUgbGljZW5zZSB0
YWcgaXMgYXBwcm9wcmlhdGUuCi0gQ29tbWl0IDllNjQ2NjE1ZGYxOTUgKDIwMjMpIHJlbW92ZWQg
YE1PRFVMRV9MSUNFTlNFYCB1bmRlciB0aGUKICBhc3N1bXB0aW9uIHRoZSBvYmplY3Qgd2FzIG5v
buKAkW1vZHVsYXIsIHdoaWNoIHdhcyBpbmNvcnJlY3QgZm9yIHRoaXMKICBkcml2ZXIgYW5kIGxl
ZCB0byB0aGUgY3VycmVudCByZWdyZXNzaW9uIChtaXNzaW5nIGxpY2Vuc2UpLgotIFRoaXMgY29t
bWl0IGNvcnJlY3RzIHRoYXQgcmVncmVzc2lvbi4KLSBBZmZlY3RlZCBzdGFibGUgc2VyaWVzOiBJ
biB0aGlzIHRyZWUsIHY2LjYsIHY2LjgsIGFuZCB2Ni4xMCBsYWNrIHRoZQogIGxpY2Vuc2UgbGlu
ZSAobW9kdWxlIHRhaW50cyBpZiBidWlsdCBhcyBhIG1vZHVsZSksIHdoaWxlIHY2LjEgc3RpbGwK
ICBoYWQgYE1PRFVMRV9MSUNFTlNFKCJHUEwgdjIiKWAuIEJhY2twb3J0IGlzIGJlbmVmaWNpYWwg
dG8gc3RhYmxlIGxpbmVzCiAgd2hlcmUgdGhlIGxpbmUgaXMgbWlzc2luZy4KCioqU3RhYmxlIENy
aXRlcmlhIEZpdCoqCi0gRml4ZXMgYSByZWFsLCB1c2VyLXZpc2libGUgcmVncmVzc2lvbiAoa2Vy
bmVsIHRhaW50IGFuZCBHUEzigJFvbmx5CiAgc3ltYm9sIGluZWxpZ2liaWxpdHkpIHdpdGggYSBt
aW5pbWFsLCBjb250YWluZWQgY2hhbmdlLgotIE5vIG5ldyBmZWF0dXJlcyBvciBBUEkgY2hhbmdl
czsgY29uZmluZWQgdG8gTUZEIHN0bXBlIEkyQyBkcml2ZXIKICBtZXRhZGF0YS4KLSBDbGVhciBh
bGlnbm1lbnQgd2l0aCBzdGFibGUgcnVsZXMgZm9yIHNtYWxsLCBsb3ctcmlzayBmaXhlcy4KCiBk
cml2ZXJzL21mZC9zdG1wZS1pMmMuYyB8IDEgKwogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9u
KCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9tZmQvc3RtcGUtaTJjLmMgYi9kcml2ZXJzL21mZC9z
dG1wZS1pMmMuYwppbmRleCBmZTAxOGJlZGFiOTgzLi43ZTJjYTM5NzU4ODI1IDEwMDY0NAotLS0g
YS9kcml2ZXJzL21mZC9zdG1wZS1pMmMuYworKysgYi9kcml2ZXJzL21mZC9zdG1wZS1pMmMuYwpA
QCAtMTM3LDMgKzEzNyw0IEBAIG1vZHVsZV9leGl0KHN0bXBlX2V4aXQpOwogCiBNT0RVTEVfREVT
Q1JJUFRJT04oIlNUTVBFIE1GRCBJMkMgSW50ZXJmYWNlIERyaXZlciIpOwogTU9EVUxFX0FVVEhP
UigiUmFiaW4gVmluY2VudCA8cmFiaW4udmluY2VudEBzdGVyaWNzc29uLmNvbT4iKTsKK01PRFVM
RV9MSUNFTlNFKCJHUEwiKTsKLS0gCjIuNTEuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMy
QHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3Jt
cmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
