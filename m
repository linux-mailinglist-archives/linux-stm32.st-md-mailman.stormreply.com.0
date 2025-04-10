Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F092A83AC2
	for <lists+linux-stm32@lfdr.de>; Thu, 10 Apr 2025 09:19:31 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 19E5AC7A843;
	Thu, 10 Apr 2025 07:19:31 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B5D98C7A829
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 10 Apr 2025 01:33:49 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 539HlAIi027027
 for <linux-stm32@st-md-mailman.stormreply.com>; Thu, 10 Apr 2025 01:33:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=/hbu+J38Osl
 kyyaqUl3TD0hhOvybI072r0nxhEaLcKQ=; b=H9yJUA9bw3vdhwFOIqJSwaKyDPs
 VH7D+VDM0GQ7CVhfxld0MT66iEEwGqU+XnAmi5bFqjn22L85W9fVXZW7IMSfWJ9T
 XUI+zEbIUhB8RiaZ6fddg/RtKp5jaP2vZg1QRg5WNgeAHP2Ixrnw8eUEoB9ETKA2
 M1p52z+mdIRgU4FIW7mwx6rLK2NYKABmFJMelJA2BDu6WtX8nPhkElITkFuw+Ir+
 q7l31eH/ItXMqwT84tH53XwCEYzRv5eYNZkc5XBh7KrqXmYzg5J3a5w3d6yVsZPX
 iZS+8GihNblIq6kFOr2Eyzk5+8PP0QQvLLUzpoIyN432Tl28GS4Ax+SVHaw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twfkn308-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 10 Apr 2025 01:33:48 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id
 d9443c01a7336-2240a960f9cso3061015ad.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 09 Apr 2025 18:33:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744248827; x=1744853627;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/hbu+J38OslkyyaqUl3TD0hhOvybI072r0nxhEaLcKQ=;
 b=rDSkBLiZIzIQvwLFG6MDutUIco/2Op+Q9STaDG1De6qXBHIv/VgLDWdolnTH3x9743
 5igiWg6l7vgBO5x3lsMK5iVbko0EKARdc+o+BIbqDmD7EsyWcWSHUVL3htqZ/7blGylu
 pattmvvOwOvGjaRkdv8SoLEuz+js+px4vNgo5o2XhWcp5+C/P83WcJ6XbyRPNV1Mkscs
 Jg5+OOc7d9p6vvJ6OU+7dnQkO8w+TdhFLC5TrfF4M+gdwH4rirgXa4HCQZPs+dfH9ZwW
 Mb1udnRRcuNJEh1MMzcaVNiOi55C0TYaxXAKebmTW9pWSYh4Km4Ss416QkLkDftPCLas
 7fTw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXNnsBGs9X84DSD6s4G49nS7gvZn0dprfzknOUNw+KNIYRfcMBnXaheco7z4ce0iHQ00OGpARt2Ia6bGA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yyl9W4+jrbD96VhAZGijn7TzDdWtYjSgIiFij9PEP912vg311fw
 aA2rJ3y1cyc+N3enzrbq5EBKsApyO9VOLoT8AbNuf31IcPV55zZbjH6MAgmmNgIJ7/tfzpyZHOv
 pEQEPU1cdwnNKF5qL5un3iLkAV80JTwP+0YIIA616MdnMQ/vWcbi6s5b8imI99fFl2sTo6agi/z
 t0y6I=
X-Gm-Gg: ASbGncsoKXhiBEhCqyDUL7KrK326eUsyCXXgl1ohc+qANYwEJxQPXLNecJw0aq0Vc/r
 +S1F4r7ZN2+U8Opylixju8OFUp69h86TgtMm5LyB2zOWl/VqgS+yVWLCd0bhq+AV67gaGe5e7yU
 kSRG9+Fff90buxXW5NLDngWad8Wd/rRVPTRbZzDCzLzfkUawOBZVvqxxvYvGjANXuHJGhTh1S2P
 RTR4j6jrsuZNmNtpSmk9o9z2b6cX7I4hy0yRDHMo/bVGltMea3nBCYHtmlwXSFRWFvsLSsl3EFr
 ns0ocOs5xAsRyBzGEh146stvuViG2W/PjZFZjH8P7flR/kSXfUQigVI/jW5T/a3vQgIoxno=
X-Received: by 2002:a17:902:d2ca:b0:223:5a6e:b2c with SMTP id
 d9443c01a7336-22b2edd2d5amr14924785ad.17.1744248826349; 
 Wed, 09 Apr 2025 18:33:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEbZM9pDJc+QEgclUt66GbWgtrAL7JKUny/wc6kcLIOC46cExebvjVHkQBn+tXU3uwE77c53w==
X-Received: by 2002:a17:902:d2ca:b0:223:5a6e:b2c with SMTP id
 d9443c01a7336-22b2edd2d5amr14924405ad.17.1744248825829; 
 Wed, 09 Apr 2025 18:33:45 -0700 (PDT)
Received: from jiegan-gv.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com.
 [103.229.16.4]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-22ac7ccb596sm18801815ad.220.2025.04.09.18.33.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Apr 2025 18:33:45 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
 Mike Leach <mike.leach@linaro.org>, James Clark <james.clark@linaro.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Date: Thu, 10 Apr 2025 09:33:26 +0800
Message-Id: <20250410013330.3609482-2-jie.gan@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250410013330.3609482-1-jie.gan@oss.qualcomm.com>
References: <20250410013330.3609482-1-jie.gan@oss.qualcomm.com>
MIME-Version: 1.0
X-Proofpoint-GUID: rwBTBRXgS-OULmMBKNrHIRdXALQrHg43
X-Proofpoint-ORIG-GUID: rwBTBRXgS-OULmMBKNrHIRdXALQrHg43
X-Authority-Analysis: v=2.4 cv=b7Oy4sGx c=1 sm=1 tr=0 ts=67f71ffc cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=QSMfYRlErQPllaMuWGUA:9
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-09_06,2025-04-08_04,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0
 priorityscore=1501 suspectscore=0 mlxscore=0 impostorscore=0 phishscore=0
 clxscore=1011 spamscore=0 mlxlogscore=790 bulkscore=0 lowpriorityscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504100010
X-Mailman-Approved-At: Thu, 10 Apr 2025 07:19:28 +0000
Cc: devicetree@vger.kernel.org, Jinlong Mao <quic_jinlmao@quicinc.com>,
 linux-arm-msm@vger.kernel.org, coresight@lists.linaro.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Tingwei Zhang <quic_tingweiz@quicinc.com>,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v2 1/5] coresight: tmc: Introduce new APIs to
	get the RWP offset of ETR buffer
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

The new functions calculate and return the offset to the write pointer of
the ETR buffer based on whether the memory mode is SG, flat or reserved.
The functions have the RWP offset can directly read data from ETR buffer,
enabling the transfer of data to any required location.

Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 .../hwtracing/coresight/coresight-tmc-etr.c   | 62 +++++++++++++++++++
 drivers/hwtracing/coresight/coresight-tmc.h   |  1 +
 2 files changed, 63 insertions(+)

diff --git a/drivers/hwtracing/coresight/coresight-tmc-etr.c b/drivers/hwtracing/coresight/coresight-tmc-etr.c
index 76a8cb29b68a..ed8a89fcd3fc 100644
--- a/drivers/hwtracing/coresight/coresight-tmc-etr.c
+++ b/drivers/hwtracing/coresight/coresight-tmc-etr.c
@@ -1236,6 +1236,68 @@ void tmc_etr_disable_hw(struct tmc_drvdata *drvdata)
 	drvdata->etr_buf = NULL;
 }
 
+static long tmc_etr_flat_resrv_get_rwp_offset(struct tmc_drvdata *drvdata)
+{
+	dma_addr_t paddr = drvdata->sysfs_buf->hwaddr;
+	u64 rwp;
+
+	rwp = tmc_read_rwp(drvdata);
+	return rwp - paddr;
+}
+
+static long tmc_etr_sg_get_rwp_offset(struct tmc_drvdata *drvdata)
+{
+	struct etr_buf *etr_buf = drvdata->sysfs_buf;
+	struct etr_sg_table *etr_table = etr_buf->private;
+	struct tmc_sg_table *table = etr_table->sg_table;
+	long w_offset;
+	u64 rwp;
+
+	rwp = tmc_read_rwp(drvdata);
+	w_offset = tmc_sg_get_data_page_offset(table, rwp);
+
+	return w_offset;
+}
+
+/**
+ * tmc_etr_get_rwp_offset() - Retrieving the offset to the write pointer.
+ *
+ * @drvdata: driver data of TMC device.
+ *
+ * Retrieve the offset to the write pointer of the ETR
+ * buffer based on whether the memory mode is SG, flat or reserved.
+ *
+ * Return w_offset of the ETR buffer upon success, else the error number.
+ */
+long tmc_etr_get_rwp_offset(struct tmc_drvdata *drvdata)
+{
+	struct etr_buf *etr_buf;
+	long w_offset;
+
+	if (WARN_ON(!drvdata) || WARN_ON(!drvdata->sysfs_buf) ||
+	    WARN_ON(drvdata->config_type != TMC_CONFIG_TYPE_ETR))
+		return -EINVAL;
+
+	etr_buf = drvdata->sysfs_buf;
+	/* Disable the ETR if it is running */
+	if (coresight_get_mode(drvdata->csdev) != CS_MODE_DISABLED)
+		__tmc_etr_disable_hw(drvdata);
+
+	if (etr_buf->mode == ETR_MODE_ETR_SG)
+		w_offset = tmc_etr_sg_get_rwp_offset(drvdata);
+	else if (etr_buf->mode == ETR_MODE_FLAT || etr_buf->mode == ETR_MODE_RESRV)
+		w_offset = tmc_etr_flat_resrv_get_rwp_offset(drvdata);
+	else
+		w_offset = -EINVAL;
+
+	/* Restart the ETR if the mode is not disabled */
+	if (coresight_get_mode(drvdata->csdev) != CS_MODE_DISABLED)
+		__tmc_etr_enable_hw(drvdata);
+
+	return w_offset;
+}
+EXPORT_SYMBOL_GPL(tmc_etr_get_rwp_offset);
+
 static struct etr_buf *tmc_etr_get_sysfs_buffer(struct coresight_device *csdev)
 {
 	int ret = 0;
diff --git a/drivers/hwtracing/coresight/coresight-tmc.h b/drivers/hwtracing/coresight/coresight-tmc.h
index 6541a27a018e..945c69f6e6ca 100644
--- a/drivers/hwtracing/coresight/coresight-tmc.h
+++ b/drivers/hwtracing/coresight/coresight-tmc.h
@@ -442,5 +442,6 @@ void tmc_etr_remove_catu_ops(void);
 struct etr_buf *tmc_etr_get_buffer(struct coresight_device *csdev,
 				   enum cs_mode mode, void *data);
 extern const struct attribute_group coresight_etr_group;
+long tmc_etr_get_rwp_offset(struct tmc_drvdata *drvdata);
 
 #endif
-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
