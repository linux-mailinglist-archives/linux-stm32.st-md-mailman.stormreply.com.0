Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WPhVBONte2mMEgIAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Thu, 29 Jan 2026 15:25:39 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BDA5B0E76
	for <lists+linux-stm32@lfdr.de>; Thu, 29 Jan 2026 15:25:38 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 26ECBC56603;
	Thu, 29 Jan 2026 14:25:38 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2793FC1A97C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 29 Jan 2026 14:25:35 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 60TAPerg3641976
 for <linux-stm32@st-md-mailman.stormreply.com>; Thu, 29 Jan 2026 14:25:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=qcppdkim1; bh=oSQPqso7JiLEAC9KBcnanR
 cpr9Jj5fwMPnM/9PQb6kY=; b=EpMkBqEGBmcYypOuIKyAKP79ivvk65dJrb8hWF
 PB64KaQh0Zl72+ZCVGFL8YIy0r/KTGD2md0iI1Xrv7egZodqVDIaFY3UIf0S7eby
 GoTfdKpnw13jmi4U9iprKMN96zJhZg9SCHeM0+NNXDk00ZwVajY2zR+PWEJSKQJu
 gILGlBId9G0KdTYbV6siDsC1VzwjrZh1cE8X7mlCqXru6TFlqydgY+7opDmLbcWd
 IP3WyUI9wLaAibrOBpeJvYKBa08kP07NDa44KDZjRYWgE8ICeMGo3hmpcSss0q7A
 b0ZWSJyz2hmKJrZKJlhBYv3XIrac7VHhL6xIlxQ1p8674rjA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c05sr0ntb-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 29 Jan 2026 14:25:34 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id
 98e67ed59e1d1-352e6fcd72dso1614444a91.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 29 Jan 2026 06:25:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1769696734; x=1770301534;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:from:to:cc:subject:date:message-id:reply-to;
 bh=oSQPqso7JiLEAC9KBcnanRcpr9Jj5fwMPnM/9PQb6kY=;
 b=Q6w14LcrPeIgcSU4RwG2SzjG+Kaj3HTxHdwGAHyA2vj5ZM1pMKQMVwWcrfwsMPzDyK
 Fzofdv3uxHvv7Da49EYr1a6ZiE8/AEAFmgf0JiRzVNNv/sFwkQJDTq6IPHDWTfr360CA
 ykuWwCMMUc33GZSblBsNBfISwu4VAUNvIgWBcaWyVJPomDfFRldGIWSOSYV6f5Ie6WiP
 anh5ujiFKqHQ2GBWpCTT7td/ayFecJfo4LBsLa7HivHfuLlwbJ0Sty3hxoFc+3zr1ir+
 e9+jyXtvvL3eeHbeeiS7INF5XhC6YttXwWWArK9V8iYdihAwC3zrqF0Mi3MmgpXwrccj
 aL1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769696734; x=1770301534;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=oSQPqso7JiLEAC9KBcnanRcpr9Jj5fwMPnM/9PQb6kY=;
 b=FK10+DY2uFhIrRueiKRxawQFFAcIDxgVibGeyh0nZ1A2hl9FywxMP0iCB5xJrKhOLX
 eCR4o6Sfy/+QobtCSt+JxbuWOtcaZZFUKnMDOb5bEOQg9QojsW6GUQaxxTPaguhpCOEf
 bnD66WIw6AJbVfZZfbvKOoJ8rAMrG4uXtfxiiBqfA/89XpDXyfgERAcvzkb4Hx+tMUqe
 QKULLB9faai381mxsj4piqaFKMbDwFqZ67OBRBfIGVqXSBsv0S539iJIVvDgDO5bybJe
 iman6ISEjn/ZTGsB2/pyC3aBcd3uJ+MuERbaL1IT9yPsNUE3NPUxhwRYm11WnYrdr65x
 lywA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWtQmZtDscTk5/UZgyhOx8IMbkyo63iBaA7e97XiFBuB8Bkq7pcicFZdee9/cbpUm6/0+xHSYsc4gFmzA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yz9krjsoaIh/f389ilCa9kIuDJO1+zklkOXZVqNytGJaN646Jsh
 6MJwfeVN87t5QvemZpi/IYrEZcWjjrRLiskJNnLrW4kR3FqEHhl3mo3Ju9159QuI8NbpPkdWiFy
 7FQS0qbqdlvI+AOebBSnyjVhh9m8N2MIvzF4LH2mdtMFok38RiJVaOr6lc8xgT8xR+cBRICCmZd
 eL2Xntih8=
X-Gm-Gg: AZuq6aKE1Qnyyz3d/uSgujUtIC5Jl1HEp99p23Ks7Rs5NdGxmOFh8c7Uapv1cG7ahjJ
 ck4ArLUNFQFcKm58FrhXlKCBUGUf6kldd9jcI1u2Godpdos/Dj/ZfEPfILdqgRFQk4tQS30mcUU
 EX9tyOxkNnlK7cZBaJzPX7jV/dKwcrgRRVea2M8DGs8MNrVhZmpMOuhVdCJMnv4Y+6cFCnC8Q5n
 pCHtqBlXSKEH9KNhutqX8pp9mGUz4o1UXs20FiXRaqPYC5+VM9UwE0ny/9RxR01I9RwCOoUJiRg
 td7T++hWV6WORK+X420asEbmBPeDSPJqcn96U5orUMeP1gaKHt4jL3Kvhjefn2UcmWK5Np37L/3
 QjFHJXh/72gBxpNC/amyz3PaiQEKU3hgE8m5h8s12O6v8JjyfczLCHgv9qf4w1BPvDW2lOX6vRk
 GqZQ==
X-Received: by 2002:a05:6300:14c:b0:35d:2172:6010 with SMTP id
 adf61e73a8af0-38ec63ca613mr9349379637.51.1769696733391; 
 Thu, 29 Jan 2026 06:25:33 -0800 (PST)
X-Received: by 2002:a05:6300:14c:b0:35d:2172:6010 with SMTP id
 adf61e73a8af0-38ec63ca613mr9349333637.51.1769696732726; 
 Thu, 29 Jan 2026 06:25:32 -0800 (PST)
Received: from jinlmao-gv.qualcomm.com
 (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2a88b4c40e1sm52999015ad.55.2026.01.29.06.25.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Jan 2026 06:25:32 -0800 (PST)
From: Yingchao Deng <yingchao.deng@oss.qualcomm.com>
Date: Thu, 29 Jan 2026 22:25:07 +0800
MIME-Version: 1.0
Message-Id: <20260129-p_ost-v5-1-2b14fff39428@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAMJte2kC/42Myw6CMBBFf8V0bUmfFF35H4aY0g7SRCi2SDSEf
 7ewMj4SN5OcyT1nQhGCg4j2mwkFGF10vksgtxtkGt2dATubGDHCJCVM4P7k44CtJJJVQnOqOEr
 bPkDt7mvnWCZuXBx8eKzZUSzf98IoMMXWAFRa1UBrevAxZtebvhjftlk6S/ebxHPJNMlrS6T8J
 eWEst2rpJZQYQVVVv0tETC64BYEFOJTKud5fgJM2R1+QAEAAA==
To: Steven Rostedt <rostedt@goodmis.org>,
 Masami Hiramatsu <mhiramat@kernel.org>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Jonathan Corbet <corbet@lwn.net>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1769696728; l=13269;
 i=yingchao.deng@oss.qualcomm.com; s=20251024; h=from:subject:message-id;
 bh=m0SivMH4qU2C480k94zrKGIj4JgPhQBQzNZ+vZrK148=;
 b=YM2XryB2dMSK9R4XocwGM2wFbEN9kxz9VpmPTcIeqYjaPlpSZemrsdREDfmsHSPvJmjF6mCvF
 eStH6QtCNncA/HcKEoIMx63jLot0+Z5QaabGhTofTRFvEkLrgJXLwcS
X-Developer-Key: i=yingchao.deng@oss.qualcomm.com; a=ed25519;
 pk=NtBn/z8P2AMtGDeVaBWYauT/J/B0Js461LF0fOHs/u8=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI5MDA5OCBTYWx0ZWRfX79ABIMjnThyz
 CptA9lK92p3gS0wxCGDkZwExQOHc3D34HOQtNe8gufOwHGFr42Kfe7wRRrAV5wqHvGKb13cgy2S
 +eNlzjFI+ey4GUU+XmI5R0UNkYbYLJxHfg08k26PKDzzohMHdmkZR/hS9sldFHPSfD0JRdPHPii
 SYdM/Px/dxlFoJHb7R1XkZDGS3w+tCehwMzn1RIRoJbIepeSiSnb76WnpRWCBLDjPJ6QDWhKLbD
 cX1/X8RyXc4jtECq45s/+q4skpf8pWDzU9uLxxjbPH29GvAV6KpxNwbjNcxYyT466OgDzVeILS9
 SeBQRTqnC8by0RfKXSIqSJm4sPja5gBRvFe8bPbQmzzO8f3LA377PAOBL/ukwuy7VsL11PY+5WO
 6BTsGZGQJJHM6ajB5pl2a1xvs2TQcbgWWGUhJI5ugAeUwhZuqZLVAGMQ1VnAALJQvsvo6ctwDit
 ByEotPWHJfFOYWuu6xw==
X-Proofpoint-ORIG-GUID: AbOrUTCKPslroaXjHuIwcbGfbPSUq4iH
X-Authority-Analysis: v=2.4 cv=UsJu9uwB c=1 sm=1 tr=0 ts=697b6dde cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8
 a=XxusR3KdFzf1ftiqTncA:9 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: AbOrUTCKPslroaXjHuIwcbGfbPSUq4iH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-29_02,2026-01-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 impostorscore=0 phishscore=0 clxscore=1011
 spamscore=0 malwarescore=0 adultscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601290098
Cc: linux-doc@vger.kernel.org, quic_yingdeng@quicinc.com,
 linux-kernel@vger.kernel.org, Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>,
 Jinlong Mao <jinlong.mao@oss.qualcomm.com>,
 Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
 Yingchao Deng <yingchao.deng@oss.qualcomm.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-trace-kernel@vger.kernel.org
Subject: [Linux-stm32] [PATCH v5] stm: class: Add MIPI OST protocol support
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [5.29 / 15.00];
	DMARC_POLICY_REJECT(2.00)[qualcomm.com : SPF not aligned (relaxed),reject];
	SUSPICIOUS_RECIPS(1.50)[];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	R_DKIM_REJECT(1.00)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:rostedt@goodmis.org,m:mhiramat@kernel.org,m:mathieu.desnoyers@efficios.com,m:corbet@lwn.net,m:alexander.shishkin@linux.intel.com,m:mcoquelin.stm32@gmail.com,m:alexandre.torgue@foss.st.com,m:linux-doc@vger.kernel.org,m:quic_yingdeng@quicinc.com,m:linux-kernel@vger.kernel.org,m:yuanfang.zhang@oss.qualcomm.com,m:jinlong.mao@oss.qualcomm.com,m:tingwei.zhang@oss.qualcomm.com,m:yingchao.deng@oss.qualcomm.com,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,m:linux-trace-kernel@vger.kernel.org,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	GREYLIST(0.00)[pass,meta];
	FORGED_SENDER(0.00)[yingchao.deng@oss.qualcomm.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	RCPT_COUNT_TWELVE(0.00)[17];
	FREEMAIL_TO(0.00)[goodmis.org,kernel.org,efficios.com,lwn.net,linux.intel.com,gmail.com,foss.st.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	DKIM_TRACE(0.00)[qualcomm.com:-,oss.qualcomm.com:-];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[yingchao.deng@oss.qualcomm.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,stormreply.com:url,stormreply.com:email]
X-Rspamd-Queue-Id: 9BDA5B0E76
X-Rspamd-Action: no action

Add MIPI OST(Open System Trace) protocol support for stm to format the
traces. The OST Protocol abstracts the underlying layers from the sending
and receiving applications, thus removing dependencies on the connection
media and platform implementation.

OST over STP packet consists of Header/Payload/End. Header is designed to
include the information required by all OST packets. Information  that is
not shared by all packets is left to the higher layer protocols. Thus, the
OST Protocol Header can be regarded as the first part of a complete OST
Packet Header, while a higher layer header can be regarded as an extension
designed for a specific purpose.

+--------+--------+--------+--------+
| start  |version |entity  |protocol|
+--------+--------+--------+--------+
|    stm version  |      magic      |
+-----------------------------------+
|                cpu                |
+-----------------------------------+
|              timestamp            |
|                                   |
+-----------------------------------+
|                tgid               |
|                                   |
+-----------------------------------+
|               payload             |
+-----------------------------------+
|                 ...      |  end   |
+-----------------------------------+

In header, there will be STARTSIMPLE/VERSION/ENTITY/PROTOCOL.
STARTSIMPLE is used to signal the beginning of a simplified OST protocol.
The Version field is a one byte, unsigned number identifying the version
of the OST Protocol. The Entity ID field is a one byte unsigned number
that identifies the source.

The Protocol ID field is a one byte unsigned number identifying the higher
layer protocol of the OST Packet, i.e. identifying the format of the data
after the OST Protocol Header. OST Control Protocol ID value represents
the common control protocol, the remaining Protocol ID values may be used
by any higher layer protocols capable of being transported by the OST
Protocol.

Co-developed-by: Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>
Signed-off-by: Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>
Co-developed-by: Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>
Signed-off-by: Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>
Co-developed-by: Jinlong Mao <jinlong.mao@oss.qualcomm.com>
Signed-off-by: Jinlong Mao <jinlong.mao@oss.qualcomm.com>
Signed-off-by: Yingchao Deng <yingchao.deng@oss.qualcomm.com>
---
Changes in v5:
1. Add Co-developed-by tag.
2. Use yearless copyright for new file.
- Link to v4: https://lore.kernel.org/all/20251024-p_ost-v4-1-3652a06fd055@oss.qualcomm.com/

Changes in v4:
1. Delete unused variable 'i'.
2. Fix build error: call to undeclared function 'task_tgid_nr'.
Link to v3 - https://lore.kernel.org/all/20251022071834.1658684-1-yingchao.deng@oss.qualcomm.com/

Changes in v3:
1. Add more details about OST.
2. Delete 'entity_available' node, and 'entity' node will show available
and currently selected (shown in square brackets) entity.
3. Removed the usage of config_item->ci_group->cg_subsys->su_mutex.
Link to v2 - https://lore.kernel.org/all/20230419141328.37472-1-quic_jinlmao@quicinc.com/
---
 .../ABI/testing/configfs-stp-policy-p_ost          |   6 +
 Documentation/trace/p_ost.rst                      |  36 ++++
 drivers/hwtracing/stm/Kconfig                      |  14 ++
 drivers/hwtracing/stm/Makefile                     |   2 +
 drivers/hwtracing/stm/p_ost.c                      | 236 +++++++++++++++++++++
 5 files changed, 294 insertions(+)

diff --git a/Documentation/ABI/testing/configfs-stp-policy-p_ost b/Documentation/ABI/testing/configfs-stp-policy-p_ost
new file mode 100644
index 000000000000..3cc4b38b456e
--- /dev/null
+++ b/Documentation/ABI/testing/configfs-stp-policy-p_ost
@@ -0,0 +1,6 @@
+What:		/config/stp-policy/<device>:p_ost.<policy>/<node>/entity
+Date:		Jan 2026
+KernelVersion:	6.20
+Description:
+		Set the entity which is to identify the source, RW.
+
diff --git a/Documentation/trace/p_ost.rst b/Documentation/trace/p_ost.rst
new file mode 100644
index 000000000000..df93b889eb4c
--- /dev/null
+++ b/Documentation/trace/p_ost.rst
@@ -0,0 +1,36 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+===================
+MIPI OST over STP
+===================
+
+The OST(Open System Trace) driver is used with STM class devices to
+generate standardized trace stream. Trace sources can be identified
+by different entity ids.
+
+CONFIG_STM_PROTO_OST is for p_ost driver enablement. Once this config
+is enabled, you can select the p_ost protocol by command below:
+
+# mkdir /sys/kernel/config/stp-policy/stm0:p_ost.policy
+
+The policy name format is extended like this:
+    <device_name>:<protocol_name>.<policy_name>
+
+With coresight-stm device, it will be look like "stm0:p_ost.policy".
+
+With MIPI OST protocol driver, the attributes for each protocol node is:
+# mkdir /sys/kernel/config/stp-policy/stm0:p_ost.policy/default
+# ls /sys/kernel/config/stp-policy/stm0:p_ost.policy/default
+channels  entity    masters
+
+The entity here is the set the entity that p_ost supports. Currently
+p_ost supports ftrace, console and diag entity.
+
+Set entity:
+# echo 'ftrace' > /sys/kernel/config/stp-policy/stm0:p_ost.policy/default/entity
+
+Get available and currently selected (shown in square brackets) entity that p_ost supports:
+# cat /sys/kernel/config/stp-policy/stm0:p_ost.policy/default/entity
+[ftrace] console diag
+
+See Documentation/ABI/testing/configfs-stp-policy-p_ost for more details.
diff --git a/drivers/hwtracing/stm/Kconfig b/drivers/hwtracing/stm/Kconfig
index eda6b11d40a1..daa4aa09f64d 100644
--- a/drivers/hwtracing/stm/Kconfig
+++ b/drivers/hwtracing/stm/Kconfig
@@ -40,6 +40,20 @@ config STM_PROTO_SYS_T
 
 	  If you don't know what this is, say N.
 
+config STM_PROTO_OST
+	tristate "MIPI OST STM framing protocol driver"
+	default CONFIG_STM
+	help
+	  This is an implementation of MIPI OST protocol to be used
+	  over the STP transport. In addition to the data payload, it
+	  also carries additional metadata for entity, better
+	  means of trace source identification, etc.
+
+	  The receiving side must be able to decode this protocol in
+	  addition to the MIPI STP, in order to extract the data.
+
+	  If you don't know what this is, say N.
+
 config STM_DUMMY
 	tristate "Dummy STM driver"
 	help
diff --git a/drivers/hwtracing/stm/Makefile b/drivers/hwtracing/stm/Makefile
index 1692fcd29277..d9c8615849b9 100644
--- a/drivers/hwtracing/stm/Makefile
+++ b/drivers/hwtracing/stm/Makefile
@@ -5,9 +5,11 @@ stm_core-y		:= core.o policy.o
 
 obj-$(CONFIG_STM_PROTO_BASIC) += stm_p_basic.o
 obj-$(CONFIG_STM_PROTO_SYS_T) += stm_p_sys-t.o
+obj-$(CONFIG_STM_PROTO_OST)   += stm_p_ost.o
 
 stm_p_basic-y		:= p_basic.o
 stm_p_sys-t-y		:= p_sys-t.o
+stm_p_ost-y		:= p_ost.o
 
 obj-$(CONFIG_STM_DUMMY)	+= dummy_stm.o
 
diff --git a/drivers/hwtracing/stm/p_ost.c b/drivers/hwtracing/stm/p_ost.c
new file mode 100644
index 000000000000..51fffa942959
--- /dev/null
+++ b/drivers/hwtracing/stm/p_ost.c
@@ -0,0 +1,236 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ *
+ * MIPI OST framing protocol for STM devices.
+ */
+
+#include <linux/pid.h>
+#include <linux/sched/clock.h>
+#include <linux/slab.h>
+#include <linux/stm.h>
+#include "stm.h"
+
+/*
+ * OST Base Protocol Header
+ *
+ * Position	Bits	Field Name
+ *      0       8       STARTSIMPLE
+ *      1       8       Version
+ *      2       8       Entity ID
+ *      3       8       protocol ID
+ */
+#define OST_FIELD_STARTSIMPLE		0
+#define OST_FIELD_VERSION		8
+#define OST_FIELD_ENTITY		16
+#define OST_FIELD_PROTOCOL		24
+
+#define OST_TOKEN_STARTSIMPLE		0x10
+#define OST_VERSION_MIPI1		0x10
+
+/* entity id to identify the source*/
+#define OST_ENTITY_FTRACE		0x01
+#define OST_ENTITY_CONSOLE		0x02
+#define OST_ENTITY_DIAG			0xEE
+
+#define OST_CONTROL_PROTOCOL		0x0
+
+#define DATA_HEADER ((OST_TOKEN_STARTSIMPLE << OST_FIELD_STARTSIMPLE) | \
+		     (OST_VERSION_MIPI1 << OST_FIELD_PROTOCOL) | \
+		     (OST_CONTROL_PROTOCOL << OST_FIELD_PROTOCOL))
+
+#define STM_MAKE_VERSION(ma, mi)	(((ma) << 8) | (mi))
+#define STM_HEADER_MAGIC		(0x5953)
+
+enum ost_entity_type {
+	OST_ENTITY_TYPE_NONE,
+	OST_ENTITY_TYPE_FTRACE,
+	OST_ENTITY_TYPE_CONSOLE,
+	OST_ENTITY_TYPE_DIAG,
+};
+
+static const char * const str_ost_entity_type[] = {
+	[OST_ENTITY_TYPE_NONE]		= "none",
+	[OST_ENTITY_TYPE_FTRACE]	= "ftrace",
+	[OST_ENTITY_TYPE_CONSOLE]	= "console",
+	[OST_ENTITY_TYPE_DIAG]		= "diag",
+};
+
+static const u32 ost_entity_value[] = {
+	[OST_ENTITY_TYPE_NONE]		= 0,
+	[OST_ENTITY_TYPE_FTRACE]	= OST_ENTITY_FTRACE,
+	[OST_ENTITY_TYPE_CONSOLE]	= OST_ENTITY_CONSOLE,
+	[OST_ENTITY_TYPE_DIAG]		= OST_ENTITY_DIAG,
+};
+
+struct ost_policy_node {
+	enum ost_entity_type	entity_type;
+};
+
+struct ost_output {
+	struct ost_policy_node	node;
+};
+
+/* Set default entity type as none */
+static void ost_policy_node_init(void *priv)
+{
+	struct ost_policy_node *pn = priv;
+
+	pn->entity_type = OST_ENTITY_TYPE_NONE;
+}
+
+static int ost_output_open(void *priv, struct stm_output *output)
+{
+	struct ost_policy_node *pn = priv;
+	struct ost_output *opriv;
+
+	opriv = kzalloc(sizeof(*opriv), GFP_ATOMIC);
+	if (!opriv)
+		return -ENOMEM;
+
+	memcpy(&opriv->node, pn, sizeof(opriv->node));
+	output->pdrv_private = opriv;
+	return 0;
+}
+
+static void ost_output_close(struct stm_output *output)
+{
+	kfree(output->pdrv_private);
+}
+
+static ssize_t ost_t_policy_entity_show(struct config_item *item,
+					char *page)
+{
+	struct ost_policy_node *pn = to_pdrv_policy_node(item);
+	ssize_t sz = 0;
+	int i;
+
+	for (i = 1; i < ARRAY_SIZE(str_ost_entity_type); i++) {
+		if (i == pn->entity_type)
+			sz += sysfs_emit_at(page, sz, "[%s] ", str_ost_entity_type[i]);
+		else
+			sz += sysfs_emit_at(page, sz, "%s ", str_ost_entity_type[i]);
+	}
+
+	sz += sysfs_emit_at(page, sz, "\n");
+	return sz;
+}
+
+static int entity_index(const char *str)
+{
+	int i;
+
+	for (i = 1; i < ARRAY_SIZE(str_ost_entity_type); i++) {
+		if (sysfs_streq(str, str_ost_entity_type[i]))
+			return i;
+	}
+
+	return 0;
+}
+
+static ssize_t
+ost_t_policy_entity_store(struct config_item *item, const char *page,
+			  size_t count)
+{
+	struct ost_policy_node *pn = to_pdrv_policy_node(item);
+	int i;
+
+	i = entity_index(page);
+	if (i)
+		pn->entity_type = i;
+	else
+		return -EINVAL;
+
+	return count;
+}
+CONFIGFS_ATTR(ost_t_policy_, entity);
+
+static struct configfs_attribute *ost_t_policy_attrs[] = {
+	&ost_t_policy_attr_entity,
+	NULL,
+};
+
+static ssize_t
+notrace ost_write(struct stm_data *data, struct stm_output *output,
+		  unsigned int chan, const char *buf, size_t count,
+		  struct stm_source_data *source)
+{
+	struct ost_output *op = output->pdrv_private;
+	unsigned int c = output->channel + chan;
+	unsigned int m = output->master;
+	const unsigned char nil = 0;
+	u32 header = DATA_HEADER;
+	struct trc_hdr {
+		u16 version;
+		u16 magic;
+		u32 cpu;
+		u64 timestamp;
+		u64 tgid;
+	} hdr;
+	ssize_t sz;
+
+	/*
+	 * Identify the source by entity type.
+	 * If entity type is not set, return error value.
+	 */
+	if (op->node.entity_type)
+		header |= ost_entity_value[op->node.entity_type];
+	else
+		return -EINVAL;
+
+	/*
+	 * STP framing rules for OST frames:
+	 *   * the first packet of the OST frame is marked;
+	 *   * the last packet is a FLAG with timestamped tag.
+	 */
+	/* Message layout: HEADER / DATA / TAIL */
+	/* HEADER */
+	sz = data->packet(data, m, c, STP_PACKET_DATA, STP_PACKET_MARKED,
+			  4, (u8 *)&header);
+	if (sz <= 0)
+		return sz;
+
+	/* DATA */
+	hdr.version	= STM_MAKE_VERSION(0, 3);
+	hdr.magic	= STM_HEADER_MAGIC;
+	hdr.cpu		= raw_smp_processor_id();
+	hdr.timestamp	= sched_clock();
+	hdr.tgid	= task_tgid_nr(current);
+	sz = stm_data_write(data, m, c, false, &hdr, sizeof(hdr));
+	if (sz <= 0)
+		return sz;
+
+	sz = stm_data_write(data, m, c, false, buf, count);
+
+	/* TAIL */
+	if (sz > 0)
+		data->packet(data, m, c, STP_PACKET_FLAG,
+			STP_PACKET_TIMESTAMPED, 0, &nil);
+
+	return sz;
+}
+
+static const struct stm_protocol_driver ost_pdrv = {
+	.owner			= THIS_MODULE,
+	.name			= "p_ost",
+	.write			= ost_write,
+	.policy_attr		= ost_t_policy_attrs,
+	.output_open		= ost_output_open,
+	.output_close		= ost_output_close,
+	.policy_node_init	= ost_policy_node_init,
+};
+
+static int ost_stm_init(void)
+{
+	return stm_register_protocol(&ost_pdrv);
+}
+module_init(ost_stm_init);
+
+static void ost_stm_exit(void)
+{
+	stm_unregister_protocol(&ost_pdrv);
+}
+module_exit(ost_stm_exit);
+
+MODULE_LICENSE("GPL");
+MODULE_DESCRIPTION("MIPI Open System Trace STM framing protocol driver");

---
base-commit: efb26a23ed5f5dc3554886ab398f559dcb1de96b
change-id: 20251024-p_ost-d5052b4a3173

Best regards,
-- 
Yingchao Deng <yingchao.deng@oss.qualcomm.com>

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
