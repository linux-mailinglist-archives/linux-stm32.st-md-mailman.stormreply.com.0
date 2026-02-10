Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aIXrEpOBi2m+UwAAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Tue, 10 Feb 2026 20:05:55 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DA69611E7EA
	for <lists+linux-stm32@lfdr.de>; Tue, 10 Feb 2026 20:05:54 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 87855C87EC0;
	Tue, 10 Feb 2026 19:05:54 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com
 [209.85.128.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0B898C1A97F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 10 Feb 2026 19:05:52 +0000 (UTC)
Received: by mail-wm1-f43.google.com with SMTP id
 5b1f17b1804b1-47edd6111b4so87640835e9.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 10 Feb 2026 11:05:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1770750352; x=1771355152;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:from:to:cc:subject:date:message-id:reply-to;
 bh=AiL2V5buxMCQLXQlQY5BGvtkymU241uAzWGqsPlvj1Y=;
 b=QISliB8q4VmbBaG5VEFKEiPZUpnS6OXJMRapDIZ7hjmNNsCC+IDDBM5FaY7NnXXAWM
 UV0O0WnRktCBePDND+/cL6MOsZB0hrT8pdJ6uigpUkCeP6CeCjgsFt6lkg9Ffpm8B+dy
 rQJMkfF7O4+G3ZkO4FR2q1F46zavyNahoGVkDGjTgcjdubAJeU9YqgnKmMXLzERKyWmP
 EdzleM4L0Fy1fzN7462sKGITiuWySDq4TXSp6dBAiYENmM97e7zaBzJdw2BA19qcj3Wt
 prxjrknbcTv7c2DY7ZahD6SHMlJh11mF4wjVdMudqbTKK5B2DneQhsmk3pTidnJ89kTu
 tH3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770750352; x=1771355152;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=AiL2V5buxMCQLXQlQY5BGvtkymU241uAzWGqsPlvj1Y=;
 b=RDHErMTDNpK1RL3B3YGYAGyIxO4IjFOwbsiK4PL9fKwyQE/S8vrl4oshw0R0Gk/UyW
 +G0eYU5kv/hrrZZZTPnZyduP9lz9jwd5XdL/hmQvyaJxbY6V+FJDXzxXy9cXBpkiYD1w
 hMmD1gdKQJmkRbyQwu+F2e58Mj6K+rJrBtNbdrAovwpz2nQ/9qj44CyDB1jako5yrp7r
 ksWAaIXY6p6UrjvXFwcipMxFsBD7/iciOZgr+bdqKGjMGUGxMFgu1YA1rLSnehA2fEbH
 pmdwV9NkS87Ie4LHsNllHspzszDFHn3Dwu0lQbPWgRqhSkZiE2ouOf1bp8fUUWII2LA1
 JgQQ==
X-Gm-Message-State: AOJu0YwW0mfabhgExFfL1s2c+1Hs8+1Gmznu2lVOA6EVKd573tbX+2t1
 sYWXnIqLnE0AGC/p/eRaEFZS/vzMMJHTn0XhzFCM5lu2A5XTGPE5kkty2g1opmR6
X-Gm-Gg: AZuq6aJXgy+1y86+3cB5Ey7UGKEyQyrhzOl8NuT/OvFsokAiOdpgKitOXqsV6C8IvDc
 n3DMgzogym47sAjUNTVChVuFaZyQ+ObAt9X3IWzyTT3VcHtUW9KWswNKG7VAFQQ9kezu6IDvyiN
 Sh+K9d1TACGc9P16a/MnxqED656OrWJPpobc+HfUQNQzS3kL/SJhGSZnkQ1LBifA4ytR/LhRp7a
 lXMEFkC5AE3lmYqxZhNB3chwh8WT7rg/W2iZnNoCfYW6pSkq7rwCnVSi/MJUpWu5EuJnPggogX5
 lcEejKuGkxgLQ9NPCisToi3D2zG70myI662rECkkQCo0NAbN8p1uQ7lK1bDJ+8Od37GO5cxf2GD
 3wzyTRztBRwMVtI1VOZqGccLcQQRz6w1MrlLBsxRjISeQFElRntlqOCnsFiKHwFWA5NVeKK/UOO
 Jd30ZlRJmfx76rSn2yubqmFxDMfIVYrBw1ZQ3FMqR2+EMnLNSo
X-Received: by 2002:a05:600c:1f94:b0:47d:5e02:14e5 with SMTP id
 5b1f17b1804b1-483507d018fmr45364095e9.5.1770750352032; 
 Tue, 10 Feb 2026 11:05:52 -0800 (PST)
Received: from localhost (39.31.66.37.rev.sfr.net. [37.66.31.39])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4376bd5a074sm18458009f8f.11.2026.02.10.11.05.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Feb 2026 11:05:51 -0800 (PST)
From: =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <legoffic.clement@gmail.com>
Date: Tue, 10 Feb 2026 20:05:45 +0100
MIME-Version: 1.0
Message-Id: <20260210-b4-firewall-upstream-v8-1-097c1e47af82@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/4WNQQ6CMBBFr0Jm7RiKAqMr72FY1DKFSYCSFquGc
 HcrF3D5XvLfXyGwFw5wzVbwHCWImxLQIQPT66ljlDYxFHlR5hdV4eOMVjy/9DDgcw6LZz1ia5l
 KIl0oS5Cms2cr7z17bxL3EhbnP/tLrH/2TzDWqLDKT2Ss4kq1dOtGLcPRuBGabdu+/oNSpLgAA
 AA=
X-Change-ID: 20250916-b4-firewall-upstream-dfe8588a21f8
To: Gatien Chevallier <gatien.chevallier@foss.st.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>
X-Mailer: b4 0.15-dev-47773
Cc: =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <legoffic.clement@gmail.com>,
 =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clement.legoffic@foss.st.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [Linux-stm32] [PATCH v8] bus: firewall: move stm32_firewall header
 file in include folder
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [3.49 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	R_DKIM_REJECT(1.00)[gmail.com:s=20230601];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MAILLIST(-0.20)[mailman];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_TO(0.00)[foss.st.com,gmail.com];
	FORGED_SENDER(0.00)[legofficclement@gmail.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	TO_DN_SOME(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_RECIPIENTS(0.00)[m:gatien.chevallier@foss.st.com,m:mcoquelin.stm32@gmail.com,m:alexandre.torgue@foss.st.com,m:legoffic.clement@gmail.com,m:clement.legoffic@foss.st.com,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:mcoquelinstm32@gmail.com,m:legofficclement@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	TAGGED_FROM(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[legofficclement@gmail.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FREEMAIL_CC(0.00)[gmail.com,foss.st.com,st-md-mailman.stormreply.com,lists.infradead.org,vger.kernel.org];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:-];
	TAGGED_RCPT(0.00)[linux-stm32];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[st.com:email,stormreply.com:url,stormreply.com:email]
X-Rspamd-Queue-Id: DA69611E7EA
X-Rspamd-Action: no action

RnJvbTogQ2zDqW1lbnQgTGUgR29mZmljIDxjbGVtZW50LmxlZ29mZmljQGZvc3Muc3QuY29tPgoK
T3RoZXIgZHJpdmVyIHRoYW4gUklGU0MgYW5kIEVUWlBDIGNhbiBpbXBsZW1lbnQgZmlyZXdhbGwg
b3BzLCBzdWNoIGFzClJDQy4KSW4gb3JkZXIgZm9yIHRoZW0gdG8gaGF2ZSBhY2Nlc3MgdG8gdGhl
IG9wcyBhbmQgdHlwZSBvZiB0aGlzIGZyYW1ld29yaywKd2UgbmVlZCB0byBnZXQgdGhlIGBzdG0z
Ml9maXJld2FsbC5oYCBmaWxlIGluIHRoZSBpbmNsdWRlLyBmb2xkZXIuCgpTaWduZWQtb2ZmLWJ5
OiBDbMOpbWVudCBMZSBHb2ZmaWMgPGNsZW1lbnQubGVnb2ZmaWNAZm9zcy5zdC5jb20+CkFja2Vk
LWJ5OiBHYXRpZW4gQ2hldmFsbGllciA8Z2F0aWVuLmNoZXZhbGxpZXJAZm9zcy5zdC5jb20+ClNp
Z25lZC1vZmYtYnk6IENsw6ltZW50IExlIEdvZmZpYyA8bGVnb2ZmaWMuY2xlbWVudEBnbWFpbC5j
b20+Ci0tLQpDaGFuZ2VzIGluIHY4OgotIFJlYmFzZSBvbiB2Ni4xOS4wCi0gVXNlIHVwcGVyY2Fz
ZSBmb3IgcGVyaXBoZXJhbCBuYW1lIGluIGNvbW1pdCBtZXNzYWdlLgotIExpbmsgdG8gdjc6IGh0
dHBzOi8vbG9yZS5rZXJuZWwub3JnL3IvMjAyNTA5MTYtYjQtZmlyZXdhbGwtdXBzdHJlYW0tdjct
MS02MDM4Y2YxZTYxZDhAZ21haWwuY29tCgpUaGUgdjcgaXMgYSBzdWJzZXQgb2YgdGhlIHY2IGFu
ZCBvdGhlciBwcmlvciB2ZXJzaW9ucywgc3BsaXRlZCB0byBzaW1wbGlmeQp0aGUgcmV2aWV3IGFu
ZCBtZXJnaW5nIHByb2Nlc3MuCgpDaGFuZ2VzIGluIHY3OgotIE5vbmUKLSBMaW5rIHRvIHY2OiBo
dHRwczovL2xvcmUua2VybmVsLm9yZy9hbGwvMjAyNTA5MDktYjQtZGRycGVyZm0tdXBzdHJlYW0t
djYtMS1jZTA4MmNjODAxYjVAZ21haWwuY29tLwotLS0KIGRyaXZlcnMvYnVzL3N0bTMyX2V0enBj
LmMgICAgICAgICAgICAgICAgICAgICAgIHwgMyArLS0KIGRyaXZlcnMvYnVzL3N0bTMyX2ZpcmV3
YWxsLmMgICAgICAgICAgICAgICAgICAgIHwgMyArLS0KIGRyaXZlcnMvYnVzL3N0bTMyX3JpZnNj
LmMgICAgICAgICAgICAgICAgICAgICAgIHwgMyArLS0KIHtkcml2ZXJzID0+IGluY2x1ZGUvbGlu
dXh9L2J1cy9zdG0zMl9maXJld2FsbC5oIHwgMAogNCBmaWxlcyBjaGFuZ2VkLCAzIGluc2VydGlv
bnMoKyksIDYgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9idXMvc3RtMzJfZXR6
cGMuYyBiL2RyaXZlcnMvYnVzL3N0bTMyX2V0enBjLmMKaW5kZXggN2ZjMGYxNjk2MGJlLi40OTE4
YTE0ZTUwN2UgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvYnVzL3N0bTMyX2V0enBjLmMKKysrIGIvZHJp
dmVycy9idXMvc3RtMzJfZXR6cGMuYwpAQCAtNSw2ICs1LDcgQEAKIAogI2luY2x1ZGUgPGxpbnV4
L2JpdGZpZWxkLmg+CiAjaW5jbHVkZSA8bGludXgvYml0cy5oPgorI2luY2x1ZGUgPGxpbnV4L2J1
cy9zdG0zMl9maXJld2FsbC5oPgogI2luY2x1ZGUgPGxpbnV4L2RldmljZS5oPgogI2luY2x1ZGUg
PGxpbnV4L2Vyci5oPgogI2luY2x1ZGUgPGxpbnV4L2luaXQuaD4KQEAgLTE2LDggKzE3LDYgQEAK
ICNpbmNsdWRlIDxsaW51eC9wbGF0Zm9ybV9kZXZpY2UuaD4KICNpbmNsdWRlIDxsaW51eC90eXBl
cy5oPgogCi0jaW5jbHVkZSAic3RtMzJfZmlyZXdhbGwuaCIKLQogLyoKICAqIEVUWlBDIHJlZ2lz
dGVycwogICovCmRpZmYgLS1naXQgYS9kcml2ZXJzL2J1cy9zdG0zMl9maXJld2FsbC5jIGIvZHJp
dmVycy9idXMvc3RtMzJfZmlyZXdhbGwuYwppbmRleCAyZmM5NzYxZGFkZWMuLmVmNDk4ODA1NGI0
NCAxMDA2NDQKLS0tIGEvZHJpdmVycy9idXMvc3RtMzJfZmlyZXdhbGwuYworKysgYi9kcml2ZXJz
L2J1cy9zdG0zMl9maXJld2FsbC5jCkBAIC01LDYgKzUsNyBAQAogCiAjaW5jbHVkZSA8bGludXgv
Yml0ZmllbGQuaD4KICNpbmNsdWRlIDxsaW51eC9iaXRzLmg+CisjaW5jbHVkZSA8bGludXgvYnVz
L3N0bTMyX2ZpcmV3YWxsLmg+CiAjaW5jbHVkZSA8bGludXgvYnVzL3N0bTMyX2ZpcmV3YWxsX2Rl
dmljZS5oPgogI2luY2x1ZGUgPGxpbnV4L2RldmljZS5oPgogI2luY2x1ZGUgPGxpbnV4L2Vyci5o
PgpAQCAtMTgsOCArMTksNiBAQAogI2luY2x1ZGUgPGxpbnV4L3R5cGVzLmg+CiAjaW5jbHVkZSA8
bGludXgvc2xhYi5oPgogCi0jaW5jbHVkZSAic3RtMzJfZmlyZXdhbGwuaCIKLQogLyogQ29ycmVz
cG9uZHMgdG8gU1RNMzJfRklSRVdBTExfTUFYX0VYVFJBX0FSR1MgKyBmaXJld2FsbCBJRCAqLwog
I2RlZmluZSBTVE0zMl9GSVJFV0FMTF9NQVhfQVJHUwkJKFNUTTMyX0ZJUkVXQUxMX01BWF9FWFRS
QV9BUkdTICsgMSkKIApkaWZmIC0tZ2l0IGEvZHJpdmVycy9idXMvc3RtMzJfcmlmc2MuYyBiL2Ry
aXZlcnMvYnVzL3N0bTMyX3JpZnNjLmMKaW5kZXggZGViZWFmOGVhMWJkLi42NTk5MGFlOGRkMDgg
MTAwNjQ0Ci0tLSBhL2RyaXZlcnMvYnVzL3N0bTMyX3JpZnNjLmMKKysrIGIvZHJpdmVycy9idXMv
c3RtMzJfcmlmc2MuYwpAQCAtNSw2ICs1LDcgQEAKIAogI2luY2x1ZGUgPGxpbnV4L2JpdGZpZWxk
Lmg+CiAjaW5jbHVkZSA8bGludXgvYml0cy5oPgorI2luY2x1ZGUgPGxpbnV4L2J1cy9zdG0zMl9m
aXJld2FsbC5oPgogI2luY2x1ZGUgPGxpbnV4L2RlYnVnZnMuaD4KICNpbmNsdWRlIDxsaW51eC9k
ZXZpY2UuaD4KICNpbmNsdWRlIDxsaW51eC9lcnIuaD4KQEAgLTE3LDggKzE4LDYgQEAKICNpbmNs
dWRlIDxsaW51eC9wbGF0Zm9ybV9kZXZpY2UuaD4KICNpbmNsdWRlIDxsaW51eC90eXBlcy5oPgog
Ci0jaW5jbHVkZSAic3RtMzJfZmlyZXdhbGwuaCIKLQogLyoKICAqIFJJRlNDIG9mZnNldCByZWdp
c3RlcgogICovCmRpZmYgLS1naXQgYS9kcml2ZXJzL2J1cy9zdG0zMl9maXJld2FsbC5oIGIvaW5j
bHVkZS9saW51eC9idXMvc3RtMzJfZmlyZXdhbGwuaApzaW1pbGFyaXR5IGluZGV4IDEwMCUKcmVu
YW1lIGZyb20gZHJpdmVycy9idXMvc3RtMzJfZmlyZXdhbGwuaApyZW5hbWUgdG8gaW5jbHVkZS9s
aW51eC9idXMvc3RtMzJfZmlyZXdhbGwuaAoKLS0tCmJhc2UtY29tbWl0OiAwNWY3ZTg5YWI5NzMx
NTY1ZDhhNjJlM2I1ZDFlYzIwNjQ4NWVlYjBiCmNoYW5nZS1pZDogMjAyNTA5MTYtYjQtZmlyZXdh
bGwtdXBzdHJlYW0tZGZlODU4OGEyMWY4CgpCZXN0IHJlZ2FyZHMsCi0tICAKQ2zDqW1lbnQgTGUg
R29mZmljIDxsZWdvZmZpYy5jbGVtZW50QGdtYWlsLmNvbT4KCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51
eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1h
bi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
